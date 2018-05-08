//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class RecommendViewModel {
    private lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()
}

// send network request
extension RecommendViewModel {
    func requestData () {
        // 1、推荐部分数据
        // 2、请求颜值部分数据
        NetworkTool.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit":"4","offset":"0","time":NSDate.getCurrentTime() as NSString]) { (result) in
            //1 result 转字典
            guard let resultDict = result as?[String:NSObject] else {
                return
            }
            guard let dataArray = resultDict["data"] as?[[String:NSObject]] else {
                
                return
            }
            
            for dict in dataArray {
//                let group = AnchorGroup(key: dict.key, value: dict.value)
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
        }
    }
}
