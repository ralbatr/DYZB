//
//  HomeViewController.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private lazy var pageTitleView : PageTitleView = {
        
        let frame = CGRect(x: 0, y: kStatuBarHeight + kNavgationHeight, width: kScreenWidth, height: 40)
        let pageTitleView = PageTitleView(frame: frame, titles: ["推荐","游戏","娱乐","趣玩"])
        pageTitleView.delegate = self
        return pageTitleView
    }()
    
    private lazy var pageContentView:PageContentView = {
        let frame = CGRect(x: 0, y: kStatuBarHeight+kNavgationHeight+40, width: kScreenWidth, height: kScreenHeight-kStatuBarHeight-kNavgationHeight-kTabbarHeight)
        var childrenVcs = [UIViewController]()
        childrenVcs.append(RecommendViewController())
        for _ in 0 ..< 3 {
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
        leftItem.setImage(UIImage(named: "logo"), for: .normal)
        leftItem.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItem)
        
        let rightItem1 = UIBarButtonItem.creatItem(imageString: "btn_search", highImageString: "btn_search_clicked", size: size)
        let rightItem2 = UIBarButtonItem.creatItem(imageString: "image_my_history", highImageString: "Image_my_history_click", size:size)
        let rightItem3 = UIBarButtonItem.creatItem(imageString: "Image_scan", highImageString: "Image_scan_click", size:size)
        
        navigationItem.rightBarButtonItems = [rightItem1,rightItem2,rightItem3]
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
