//
//  AnchorModel.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    var room_id:Int = 0
    var vertical_src : String = ""
    var isVertical:Int = 0
    var room_name:String = ""
    var nickname:String = ""
    var online:Int = 0
    
    init(key:String,value:NSObject) {
        super.init()
        let dict = NSDictionary(object: value, forKey: key as NSCopying)
        setValuesForKeys(dict as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
}
