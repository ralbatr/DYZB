//
//  CollectionNormailCell.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/7.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CollectionNormailCell: CollectionBaseCell {

    @IBOutlet weak var roomNameLabe: UILabel!
    override var anchor:AnchorModel? {
        didSet {
            super.anchor = anchor
            
            roomNameLabe.text = anchor?.room_name
        }
    }
}
