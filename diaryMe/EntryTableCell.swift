//
//  EntryTableCell.swift
//  diaryMe
//
//  Created by Kyle Nguyen on 4/10/17.
//  Copyright © 2017 Kyle Nguyen. All rights reserved.
//

import UIKit

class EntryTableCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
