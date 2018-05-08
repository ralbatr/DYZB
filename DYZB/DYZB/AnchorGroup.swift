//
//  AnchorGroup.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    
    @objc var room_list:[[String:NSObject]]?
    @objc var tag_name:String = ""
    @objc var icon_name:String = "btn_column_selected"
    
    init(dict : [String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
