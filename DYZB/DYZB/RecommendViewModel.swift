//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class RecommendViewModel {
    lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()
    private lazy var bigDataGroups:AnchorGroup = AnchorGroup()
    private lazy var prettyDataGroups:AnchorGroup = AnchorGroup()
}

// send network request
extension RecommendViewModel {
    func requestData(finshCallBack:@escaping ()->()) {
        
        let parameters = ["limit":"4","offset":"0","time":NSDate.getCurrentTime()]
        
        let dispatchgroup = DispatchGroup()
        
        dispatchgroup.enter()
        // 1、推荐部分数据
        NetworkTool.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time":NSDate.getCurrentTime()]) { (result) in
            guard let resultDict = result as?[String:NSObject] else {
                return
            }
            guard let dataArray = resultDict["data"] as?[[String:NSObject]] else {
                return
            }
            self.bigDataGroups.tag_name = "热门"
            self.bigDataGroups.icon_name = "home_header_hot"
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroups.anchors.append(anchor)
            }
            dispatchgroup.leave()
        }
        
        // 2、请求颜值部分数据
        dispatchgroup.enter()
        NetworkTool.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters as [String : NSString]) { (result) in
            guard let resultDict = result as?[String:NSObject] else {
                return
            }
            guard let dataArray = resultDict["data"] as?[[String:NSObject]] else {
                return
            }
            
            self.prettyDataGroups.tag_name = "颜值"
            self.prettyDataGroups.icon_name = "home_header_phone"
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyDataGroups.anchors.append(anchor)
            }
            dispatchgroup.leave()
        }
        
        dispatchgroup.enter()
        NetworkTool.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
            //1 result 转字典
            guard let resultDict = result as?[String:NSObject] else {
                return
            }
            guard let dataArray = resultDict["data"] as?[[String:NSObject]] else {
                return
            }
            
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            dispatchgroup.leave()
        }
        
        dispatchgroup.notify(queue: DispatchQueue.main) {
            print(self.anchorGroups.count)
            self.anchorGroups.insert(self.prettyDataGroups, at: 0)
            print(self.anchorGroups.count)
            self.anchorGroups.insert(self.bigDataGroups, at: 0)
            
            finshCallBack()
        }
    }
}
