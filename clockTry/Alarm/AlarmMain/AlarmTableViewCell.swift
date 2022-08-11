//
//  clockTableViewCell.swift
//  clockTry
//
//  Created by Hung-Ming Chen on 2022/6/30.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var clockButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
