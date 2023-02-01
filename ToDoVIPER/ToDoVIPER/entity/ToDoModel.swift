//
//  ToDoModel.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class ToDoModel {
    var toDoID: Int?
    var category: String?
    var toDo: String?
    
    init(toDoID: Int? ,category: String?, toDo: String? ) {
        self.toDoID = toDoID
        self.category = category
        self.toDo = toDo
    }
}
