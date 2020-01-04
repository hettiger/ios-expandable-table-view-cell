//
//  TodoTableViewCell.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var datePickerWrapperViewHeight: NSLayoutConstraint! {
        didSet {
            datePickerWrapperViewHeight.constant = 0
        }
    }

    @IBOutlet weak var datePickerViewHeight: NSLayoutConstraint!

    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.alpha = 0
        }
    }

    @IBOutlet weak var datePickerView: UIDatePicker! {
        didSet {
            datePickerView.isEnabled = false
            datePickerView.alpha = 0
        }
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - UITableViewCell
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: animated)
    }

}
