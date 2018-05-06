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
    }
    
    private lazy var pageTitleView : PageTitleView = {
        
        let frame = CGRect(x: 0, y: kStatuBarHeight + kNavgationHeight, width: kScreenWidth, height: 40)
        let pageTitleView = PageTitleView(frame: frame, titles: ["推荐","游戏","娱乐","优惠"])
        pageTitleView.delegate = self
        return pageTitleView
    }()
    
    private lazy var pageContentView:PageContentView = {
        let frame = CGRect(x: 0, y: kStatuBarHeight+kNavgationHeight+40, width: kScreenWidth, height: kScreenHeight)
        var childrenVcs = [UIViewController]()
        for _ in 0 ..< 4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childrenVcs.append(vc)
        }
        
        let pageContentView = PageContentView(frame: frame, childrenVcs: childrenVcs, parentViewController: self)
        pageContentView.delegate = self
        
        return pageContentView;
    }()
}

extension HomeViewController {
    
    private func setUI() {
        setupNavgationBar()
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
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

extension HomeViewController:PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex Index: Int) {
        print(Index)
        pageContentView.setContentIndex(index: Index)
    }
}

extension HomeViewController:PageContentViewDelegate {
    func pageContetnView(pageContentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, soureIndex: sourceIndex, targetInex: targetIndex)
    }
}
