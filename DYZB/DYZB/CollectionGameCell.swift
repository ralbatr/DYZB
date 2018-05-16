//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/11.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var group:AnchorGroup?{
        didSet {
            label.text = group?.tag_name
            let iconURL = URL(string: group?.icon_url ?? "")
            imageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "home_more_btn"), options:nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
