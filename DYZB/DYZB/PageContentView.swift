//
//  PageContentView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

let kReuseIdentifier = "cell"

class PageContentView: UIView {
    
    private var childrenVcs:[UIViewController]
    private var parentViewController:UIViewController
    
    init(frame: CGRect,childrenVcs:[UIViewController],parentViewController:UIViewController) {
        self.childrenVcs = childrenVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PageContentView init(coder:) has not been implemented")
    }
    
    private lazy var collectView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = bounds.size
        // 行间距
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectView.isPagingEnabled = true
        collectView.bounces = false
        collectView.frame = bounds
        collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:kReuseIdentifier)
        collectView.dataSource = self
        return collectView;
    }()

}

extension PageContentView {
    
    private func setupUI() {
        for children in childrenVcs {
            self.parentViewController.addChildViewController(children)
        }
        
        addSubview(collectView)
    }
}

extension PageContentView:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childrenVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseIdentifier, for: indexPath)
        
        for view in cell.contentView.subviews {
            view .removeFromSuperview()
        }
        let childVc = childrenVcs[indexPath.row]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

extension PageContentView {
    func setContentIndex(index:Int) {
        let offsetX = CGFloat(index)*collectView.frame.width
        
        collectView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}

