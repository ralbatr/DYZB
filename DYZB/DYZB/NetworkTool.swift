//
//  NetworkTool.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/7.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTool {
    class func requestData(type:MethodType,URLString:String,parameters:[String:NSString]?=nil,finishedCallBack: @escaping (_ result:AnyObject)->()) {
        let method = (type == MethodType.GET ? HTTPMethod.get : HTTPMethod.post)
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            
            finishedCallBack(result as AnyObject)
        }
    }
}
