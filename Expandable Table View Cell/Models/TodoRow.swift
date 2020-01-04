//
//  TodoRow.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 04.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import Foundation

// MARK: - TodoRowDelegate

protocol TodoRowDelegate: class {
    
    func todoRow(_ todoRow: TodoRow, didChangeIsEditingTo isEditing: Bool) -> Void
    
}


// MARK: - TodoRow

class TodoRow {
    
    weak var delegate: TodoRowDelegate?
        
    var isEditing = false {
        didSet {
            delegate?.todoRow(self, didChangeIsEditingTo: isEditing)
        }
    }
    
    var todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
}


// MARK: - Data

extension TodoRow {
    
    static func all() -> [TodoRow] {
        Todo.all().map { (todo) -> TodoRow in
            TodoRow(todo: todo)
        }
    }
    
}
