//
//  CycleModel.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/9.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    
    @objc var title:String = ""
    @objc var pic_url:String = ""
    @objc var anchor:AnchorModel?
    @objc var room:[String:NSObject]? {
        didSet {
            guard let room = room else {return}
            
            anchor = AnchorModel(dict: room)
        }
    }
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
