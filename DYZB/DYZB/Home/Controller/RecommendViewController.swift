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
private let kPrettyItemHight = KitemWidth*4/3
private let kCycleViewHight = kScreenWidth*3/8

private let kNormalReuseIdentifier = "kNormalReuseIdentifier"
private let kPretyReuseIdentifier = "kPretyReuseIdentifier"
private let kNormalHeadViewIdentifier = "kNormalHeadViewIdentifier"

class RecommendViewController: UIViewController {
    
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
    private lazy var recommendCycelView:RecommendCycleView = {
       let cycelView = RecommendCycleView.recommentCycleView()
        cycelView.frame = CGRect(x: 0, y: -kScreenWidth, width: kScreenWidth, height: kScreenWidth)
        return cycelView
    }()
    
    // 懒加载属性
    private lazy var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: KitemWidth, height: KitemHight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.sectionInset = UIEdgeInsetsMake(0, kItemMargin, 0, 10)
        //  组头
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 50)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionNormailCell", bundle: nil), forCellWithReuseIdentifier: kNormalReuseIdentifier)
        
        collectionView.register(UINib(nibName: "CollectionPretyCell", bundle: nil), forCellWithReuseIdentifier: kPretyReuseIdentifier)
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
        recommendVM.requestData {
            self.collectionView.reloadData()
        }
        
        recommendVM.requestCycleData {
            self.recommendCycelView.cycelModels = self.recommendVM.cycleModels
        }
    }
}


extension RecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.addSubview(recommendCycelView)
        
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewHight, left: 0, bottom: 0, right: 0)
    }
}

extension RecommendViewController {
    private func loadData() {
        NetworkTool.requestData(type: .GET, URLString: "") { (result) in
            print(result)
        }
    }
}

extension RecommendViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommendVM.anchorGroups[section]
        
        return group.anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let group = recommendVM.anchorGroups[indexPath.section]
        let anchor = group.anchors[indexPath.item]
        var cell:CollectionBaseCell
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:  kPretyReuseIdentifier, for: indexPath) as! CollectionPretyCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalReuseIdentifier, for: indexPath) as! CollectionNormailCell
        }
        cell.anchor = anchor

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kNormalHeadViewIdentifier, for: indexPath) as! CollectionHeadView
        
        let group = recommendVM.anchorGroups[indexPath.section]
        
        headView.group = group
        
        return headView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: KitemWidth, height:kPrettyItemHight )
        }
        
        return CGSize(width: KitemWidth, height: KitemHight)
    }
    
}
