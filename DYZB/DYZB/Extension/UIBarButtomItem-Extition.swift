//
//  UIBarButtomItem-Extition.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/6.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func creatItem(titel:String ,highTitle:String,size:CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setTitle(titel, for: .normal)
        btn.setTitle(highTitle, for: .highlighted)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        btn.titleLabel?.textColor = .red
        return UIBarButtonItem(customView: btn)
    }
    
    class func creatItem(imageString:String ,highImageString:String,size:CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageString), for: .normal)
        btn.setImage(UIImage(named: highImageString), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        btn.titleLabel?.textColor = .red
        return UIBarButtonItem(customView: btn)
    }
}
