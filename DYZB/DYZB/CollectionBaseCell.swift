//
//  CollectionBaseCell.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/8.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onLineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var anchor:AnchorModel? {
        didSet {
            guard let anchor = anchor else {
                return
            }
            
            var onLineStr = ""
            
            if anchor.online >= 1000{
                onLineStr = "\(Int(anchor.online/1000))万在线"
            } else {
                onLineStr = "\(anchor.online)在线"
            }
            onLineBtn.setTitle(onLineStr, for: .normal)
            nickNameLabel.text = anchor.nickname
        }
    }
}
