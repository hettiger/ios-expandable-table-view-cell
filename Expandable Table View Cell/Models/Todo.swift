//
//  Todo.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import Foundation

// MARK: - Todo

struct Todo {

    var title: String

    var dueAt: Date

}


// MARK: - Data

extension Todo {
    
    static func all() -> [Todo] {
        [
            Todo(title: "Learn Math", dueAt: .init()),
            Todo(title: "Learn Xcode", dueAt: .init()),
            Todo(title: "Learn Swift", dueAt: .init()),
        ]
    }
    
}
