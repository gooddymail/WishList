//
//  WishTableViewCell.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/10/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class WishTableViewCell: UITableViewCell {
  
  @IBOutlet weak var wishDetailLabel: UILabel!
  @IBOutlet weak var createDateLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
