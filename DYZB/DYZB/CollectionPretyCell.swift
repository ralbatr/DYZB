//
//  CollectionPretyCell.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/7.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CollectionPretyCell: CollectionBaseCell {


    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor:AnchorModel? {
        didSet {
            super.anchor = anchor
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
