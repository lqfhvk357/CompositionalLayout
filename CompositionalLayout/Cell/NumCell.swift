//
//  NumCell.swift
//  CompositionalLayout
//
//  Created by 罗超 on 2019/9/16.
//  Copyright © 2019 罗超. All rights reserved.
//

import UIKit

class NumCell: UICollectionViewCell {
    
    var num: String = "" {
        didSet {
            numLabel.text = num
        }
    }
    

    @IBOutlet weak var numLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
