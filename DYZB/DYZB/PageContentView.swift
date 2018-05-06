//
//  PageContentView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class PageContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectView:UICollectionView = {
        let collectView = UICollectionView()
        
        
        return collectView;
    }()

}

extension PageTitleView {
    
    private func setupUI() {
        
    }
}
