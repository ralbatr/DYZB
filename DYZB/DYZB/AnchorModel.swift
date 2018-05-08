//
//  AnchorModel.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    @objc var room_id:Int = 0
    @objc var vertical_src : String = ""
    @objc var isVertical:Int = 0
    @objc var room_name:String = ""
    /// 主播昵称
    @objc var nickname:String = ""
    /// 观看人数
    @objc var online:Int = 0
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
