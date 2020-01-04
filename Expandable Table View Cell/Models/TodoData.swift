//
//  TodoData.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 04.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import Foundation

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
