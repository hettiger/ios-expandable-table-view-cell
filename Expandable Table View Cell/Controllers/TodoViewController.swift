//
//  TodoViewController.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        static let cellIdentifier = "Todo Cell"
    }
    
    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
      didSet {
        tableView.tableFooterView = UIView()
      }
    }
    
    // MARK: - Properties
    
    var todoRows = TodoRow.all()
    
    // MARK: - Methods
    
    func resizeRows() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }

}


// MARK: - UITableViewDelegate

extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoRow = todoRows[indexPath.row]
        
        if let activeRow = todoRows.first(where: { $0.isEditing }), activeRow !== todoRow {
            activeRow.isEditing = false
        }
        
        todoRow.isEditing.toggle()
        resizeRows()
    }
    
}


// MARK: - UITableViewDataSource

extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        let todoRow = todoRows[indexPath.row]
        
        if let cell = cell as? TodoTableViewCell {
            cell.todoRow = todoRow
        }

        return cell
    }
    
}
