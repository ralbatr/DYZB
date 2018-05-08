//
//  NSDate-Extension.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

extension NSDate {
    class func getCurrentTime() -> NSString {
        let nowDate = Date()
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)" as NSString
    }
}
