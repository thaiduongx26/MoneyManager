//
//  AccountTableViewCell.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/19/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet var imgAcc: UIImageView!
    
    @IBOutlet var lblNameAcc: UILabel!
    
    @IBOutlet var lblMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
