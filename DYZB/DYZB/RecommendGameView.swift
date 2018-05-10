//
//  RecommendGameView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/10.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class RecommendGameView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .flexibleBottomMargin
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
