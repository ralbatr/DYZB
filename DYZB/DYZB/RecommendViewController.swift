//
//  RecommendViewController.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/7.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

private let kItemMargin:CGFloat = 10
private let KitemWidth:CGFloat = (kScreenWidth-3*kItemMargin)/2
private let KitemHight = KitemWidth*3/4

private let kNormalReuseIdentifier = "kNormalReuseIdentifier"
private let kNormalHeadViewIdentifier = "kNormalHeadViewIdentifier"

class RecommendViewController: UIViewController {
    
    // 懒加载属性
    private lazy var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: KitemWidth, height: KitemHight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.sectionInset = UIEdgeInsetsMake(0, kItemMargin, 0, 10)
        //  组头
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 50)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionNormailCell", bundle: nil), forCellWithReuseIdentifier: kNormalReuseIdentifier)
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kNormalHeadViewIdentifier)
        
        collectionView.register(UINib(nibName: "CollectionHeadView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kNormalHeadViewIdentifier)
        // 随着view大小调整
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        return collectionView;
    }()
    
    // 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
}


extension RecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
    }
}

extension RecommendViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalReuseIdentifier, for: indexPath)
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kNormalHeadViewIdentifier, for: indexPath)
                
        return headView
        
    }
}
