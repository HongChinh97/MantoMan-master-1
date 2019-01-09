//
//  TableViewCell.swift
//  MantoMan
//
//  Created by admin on 1/9/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var citiesLabel: CustomLabel!
    @IBOutlet weak var districtsLabel: CustomLabel!
    @IBOutlet weak var GenderLabel: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
