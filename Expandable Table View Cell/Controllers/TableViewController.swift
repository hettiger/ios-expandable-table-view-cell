//
//  TableViewController.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        static let numberOfExampleCells = 3
        static let cellIdentifier = "Expandable Cell"
    }
    
    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
      didSet {
        tableView.tableFooterView = UIView()
      }
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    
    
    
}


// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.numberOfExampleCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
    }
    
}
