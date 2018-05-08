//
//  CollectionHeadView.swift
//  DYZB
//
//  Created by Ralbatr on 2018/5/7.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CollectionHeadView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
        
    @IBOutlet weak var iconImageView: UIImageView!
    var group:AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: (group?.icon_name)!)
        }
    }
}
