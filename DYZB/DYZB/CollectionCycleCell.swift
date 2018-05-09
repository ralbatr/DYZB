//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by linxiaoyu on 2018/5/9.
//  Copyright © 2018年 yi. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var cycleModel:CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: iconURL)
        }
    }

}
