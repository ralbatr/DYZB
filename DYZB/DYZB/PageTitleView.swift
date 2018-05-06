//
//  PageTitleView.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    private var titles:[String]
    private lazy var titleLabel:[UILabel] = [UILabel]()
    
    init(frame: CGRect,titles: [String]) {
        self.titles = titles;
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PageTitleView init")
    }
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = bounds
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine:UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine;
    }()
}

extension PageTitleView {
    
    private func setupUI() {
        titlesLabel()
        setupBottomLine()
        scrollViewLine()
    }
    
    private func titlesLabel() {
        let width = self.frame.size.width/CGFloat(titles.count)
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.frame = CGRect(x: CGFloat(index)*width, y: 0, width: width, height: self.frame.size.height)
            label.textAlignment = .center
            label.tag = index
            titleLabel.append(label)
            addSubview(scrollView)
            scrollView.addSubview(label)
        }
    }
    
    private func setupBottomLine () {
        let lineView = UIView()
        
        lineView.backgroundColor = .lightGray
        lineView.frame = CGRect(x: 0, y: self.frame.size.height-2, width: self.frame.size.width, height: 0.5)
        addSubview(lineView)
        
        addSubview(scrollLine)
        
        
        guard let firstLabel = titleLabel.first else {
            return;
        }
        scrollLine.frame = CGRect(x: (firstLabel.frame.origin.x), y: self.frame.size.height-2, width: (firstLabel.frame.size.width), height: 2);
    }
    
    private func scrollViewLine() {
        
        let lineView = UIView()
        lineView.backgroundColor = .orange 
        
    }
}
