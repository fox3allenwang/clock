//
//  AddPageLabelCell.swift
//  clockTry
//
//  Created by Hung-Ming Chen on 2022/8/10.
//

import UIKit

class AddPageLabelCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
