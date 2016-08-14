//
//  ClassTableViewCell.swift
//  Mars
//
//  Created by Austin Childress on 8/12/16.
//  Copyright © 2016 Mars Dev. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var classNameLabel: UILabel!
    
    @IBOutlet weak var classClassLabel: UILabel!
    @IBOutlet weak var classLevelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
