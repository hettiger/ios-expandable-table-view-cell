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
            datePickerView.isUserInteractionEnabled = false
            datePickerView.alpha = 0
        }
    }
    
    // MARK: - Properties
    
    var todoRow: TodoRow? = nil {
        didSet {
            guard let todoRow = todoRow else { return }
            
            todoRow.delegate = self
            update(animated: false)
        }
    }
    
    // MARK: - Methods
    
    func update(animated: Bool) {
        guard let todoRow = todoRow else { return }

        datePickerView.isUserInteractionEnabled = todoRow.isEditing
        titleLabel.attributedText = NSAttributedString(
            string: todoRow.todo.title,
            attributes: [NSAttributedString.Key.foregroundColor : todoRow.isEditing ? UIColor.systemBlue : UIColor.label])
        valueLabel.text = DateFormatter.localizedString(from: todoRow.todo.dueAt, dateStyle: .short, timeStyle: .none)
        datePickerView.setDate(todoRow.todo.dueAt, animated: false)
        
        let animations = { [unowned self] in
            self.valueLabel.alpha = todoRow.isEditing ? 0 : 1
            self.separatorView.alpha = todoRow.isEditing ? 1 : 0
            self.datePickerView.alpha = todoRow.isEditing ? 1 : 0
            self.datePickerWrapperViewHeight.constant = todoRow.isEditing ? self.datePickerViewHeight.constant : 0
        }
        
        if animated {
            UIView.animate(withDuration: CATransaction.animationDuration(), animations: animations)
        } else {
            animations()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func datePickerViewValueChanged() {
        todoRow?.todo.dueAt = datePickerView.date
    }

    // MARK: - UITableViewCell
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: animated)
    }

}


// MARK: - TodoRowDelegate

extension TodoTableViewCell: TodoRowDelegate {
    
    func todoRow(_ todoRow: TodoRow, didChangeIsEditingTo isEditing: Bool) {
        update(animated: true)
    }
    
}
