//
//  RecommendGameView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/10.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

let kGameCellId = "kGameCellId"
class RecommendGameView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var groups:[AnchorGroup]? {
        didSet {
            if (groups?.count)! > 2 {
            groups?.removeFirst()
            groups?.removeFirst()
            }
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .flexibleBottomMargin
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle:nil), forCellWithReuseIdentifier: kGameCellId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    override func layoutSubviews() {
//        self.frame = 
    }
}

extension RecommendGameView {
    
    class func recommendGameVew() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

extension RecommendGameView:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellId, for: indexPath) as! CollectionGameCell
        
        let group = self.groups![indexPath.item];
        cell.group = group
        
        return cell
    }
}
