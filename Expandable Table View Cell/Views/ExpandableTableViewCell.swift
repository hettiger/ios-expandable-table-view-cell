//
//  ExpandableTableViewCell.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.isHidden = true
        }
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - UITableViewCell
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
