//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/9.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

let kCycleCellId = "kCycleCellId"

class RecommendCycleView: UIView {
    
//    @objc var room:[String:NSObject]? {
//        didSet {
//            guard let room = room else {return}
//
//            anchor = AnchorModel(dict: room)
//        }
//    }
    
    var room:[String :NSObject]?{
        didSet {
            
        }
    }
    
    var cycelModels:[CycleModel]?{
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = (cycelModels?.count) ?? 0
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        autoresizingMask = 
//        autoresizingMask = UIViewAutoresizing.flexibleBottomMargin
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCycleCellId)
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        layout.itemSize = collectionView.bounds.size
//        layout.scrollDirection = .horizontal
//        collectionView.isPagingEnabled = true
    }

}

extension RecommendCycleView {
    class func recommentCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

extension RecommendCycleView:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycelModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellId, for: indexPath) as! CollectionCycleCell
        cell.contentView.backgroundColor = indexPath.item%2==0 ?.red :.blue
        
        cell.cycleModel = cycelModels![indexPath.item]
        
        
        return cell
    }
    
    
}
