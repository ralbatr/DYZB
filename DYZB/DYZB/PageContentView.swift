//
//  PageContentView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

let kReuseIdentifier = "cell"

protocol PageContentViewDelegate:class {
    func pageContetnView(pageContentView:PageContentView,progress:CGFloat,sourceIndex:Int,targetIndex:Int)
}

class PageContentView: UIView {
    
    private var childrenVcs:[UIViewController]
    private var parentViewController:UIViewController
    private var startContentOffsetX:CGFloat = 0
    private var isForbidScrollDelegate : Bool = false

    weak var delegate:PageContentViewDelegate?
    
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
        collectView.delegate = self
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

extension PageContentView:UICollectionViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScrollDelegate = false
        startContentOffsetX = scrollView.contentOffset.x
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isForbidScrollDelegate {return}
        
        var progress:CGFloat = 0
        var sourceIndex:Int = 0
        var targetIndex:Int = 0
        let scrollviewW = scrollView.bounds.width
        var currentOffset = scrollView.contentOffset.x
        //you
        if   currentOffset > startContentOffsetX {
            progress = currentOffset/scrollviewW - floor(currentOffset/scrollviewW)
            sourceIndex = Int(currentOffset/scrollviewW)
            targetIndex = sourceIndex + 1
            if targetIndex >= childrenVcs.count {
                targetIndex = childrenVcs.count - 1
            }
            
            if currentOffset - startContentOffsetX == scrollviewW {
                progress = 1
                targetIndex = sourceIndex
            }
        } else {
            progress = 1 - (currentOffset/scrollviewW-floor(currentOffset/scrollviewW))
            targetIndex = Int(currentOffset/scrollviewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childrenVcs.count {
                sourceIndex = childrenVcs.count-1
            }
        }
        
//        print("progress \(progress) sourec \(sourceIndex) targetIndex \(targetIndex)")
        delegate?.pageContetnView(pageContentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
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
        isForbidScrollDelegate = true
        
        collectView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}

