//
//  HomeViewController.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.view.addSubview(pageTitleView)
    }
    
    private lazy var pageTitleView : PageTitleView = {
        
        let frame = CGRect(x: 0, y: kStatuBarHeight + kNavgationHeight, width: kScreenWidth, height: 40)
        let pageTitleView = PageTitleView(frame: frame, titles: ["推荐","游戏","娱乐","优惠"])
        
        return pageTitleView
    }()
}

extension HomeViewController {
    
    private func setUI() {
        setupNavgationBar()
        
        
    }
    
    private func setupNavgationBar() {
        let size = CGSize(width: 40, height: 40)
        
        let leftItem = UIButton()
        leftItem.setTitle("L", for: .normal)
        leftItem.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItem)
        
        let rightItem1 = UIBarButtonItem.creatItem(titel: "R1", highTitle: "RH1", size:size)
        let rightItem2 = UIBarButtonItem.creatItem(titel: "R2", highTitle: "RH2", size:size)
        navigationItem.rightBarButtonItems = [rightItem1,rightItem2]
    }
}
