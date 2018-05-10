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
    
    var cycleTimer:Timer?

    var cycelModels:[CycleModel]?{
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = (cycelModels?.count) ?? 0
            
            let indexPath = IndexPath(item: (cycelModels?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
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
        removeTimer()
        addTimer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        layout.itemSize = self.bounds.size
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
        return (cycelModels?.count ?? 0)*1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellId, for: indexPath) as! CollectionCycleCell
        cell.contentView.backgroundColor = indexPath.item%2==0 ?.red :.blue
        
        cell.cycleModel = cycelModels![indexPath.item%(cycelModels?.count)!]
        
        
        return cell
    }
}

extension RecommendCycleView {
    private func addTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    private func removeTimer() {
        cycleTimer?.invalidate()
    }
    
    @objc private func scrollToNext() {
        let currentOffsetX = collectionView.contentOffset.x
        let afterx = currentOffsetX + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: afterx, y: 0), animated: true)
    }
}

extension RecommendCycleView:UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let offsetX = scrollView.contentOffset.x + scrollView.bounds.width*0.5
        
        pageControl.currentPage = Int(offsetX/scrollView.bounds.width)%(cycelModels?.count ?? 1)!
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
}
