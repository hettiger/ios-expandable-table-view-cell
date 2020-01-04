//
//  TableViewController.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Types
    
    class Row {
        
        var todo: Todo

        var isEditing = false
        
        init(todo: Todo) {
            self.todo = todo
        }
        
    }
    
    // MARK: - Constants
    
    enum Constants {
        static let cellIdentifier = "Expandable Cell"
    }
    
    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
      didSet {
        tableView.tableFooterView = UIView()
      }
    }
    
    // MARK: - Properties
    
    var rows: Array<Row> = {
        Todo.all().map { (todo) -> Row in
            Row(todo: todo)
        }
    }()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    func configureCell(_ cell: UITableViewCell, forRow row: Row, animated: Bool) {
        if let cell = cell as? ExpandableTableViewCell {
            let animatedConfiguration = {
                cell.valueLabel.alpha = row.isEditing ? 0 : 1
                cell.separatorView.alpha = row.isEditing ? 1 : 0
                cell.datePickerView.alpha = row.isEditing ? 1 : 0
                cell.datePickerWrapperViewHeight.constant = row.isEditing ? cell.datePickerViewHeight.constant : 0
            }
            
            cell.datePickerView.isEnabled = row.isEditing
            cell.titleLabel.attributedText = NSAttributedString(string: row.todo.title, attributes: [NSAttributedString.Key.foregroundColor : row.isEditing ? UIColor.systemBlue : UIColor.label])
            cell.valueLabel.text = DateFormatter.localizedString(from: row.todo.dueAt, dateStyle: .short, timeStyle: .none)
            cell.datePickerView.setDate(row.todo.dueAt, animated: false)
            
            if animated {
                UIView.animate(withDuration: CATransaction.animationDuration(), animations: animatedConfiguration)
            } else {
                animatedConfiguration()
            }
        }
    }
    
    func resizeRows() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

}


// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let activeIndex = rows.firstIndex(where: { $0.isEditing }), activeIndex != indexPath.row {
            setEditing(false, forRowAtIndexPath: IndexPath(row: activeIndex, section: indexPath.section), animated: true)
        }
        setEditing(nil, forRowAtIndexPath: indexPath, animated: true)
        resizeRows()
    }
    
    func setEditing(_ editing: Bool?, forRowAtIndexPath indexPath: IndexPath, animated: Bool) {
        let cell = tableView.cellForRow(at: indexPath) as! ExpandableTableViewCell
        let row = rows[indexPath.row]
        row.isEditing = editing ?? !row.isEditing
        configureCell(cell, forRow: row, animated: animated)
    }
    
}


// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        let row = rows[indexPath.row]
        configureCell(cell, forRow: row, animated: false)
        return cell
    }
    
}
