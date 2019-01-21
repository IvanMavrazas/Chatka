//
//  TableViewCell.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/20/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class CustomMessageCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var senderUsername: UILabel!
    @IBOutlet weak var messageBody: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
