//
//  TableViewCell.swift
//  Gourmet_King
//
//  Created by Yoshiki Kishimoto on 2019/02/26.
//  Copyright © 2019 Yoshiki Kishimoto. All rights reserved.
//s

import UIKit

class TableViewCell: UITableViewCell {
        @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
