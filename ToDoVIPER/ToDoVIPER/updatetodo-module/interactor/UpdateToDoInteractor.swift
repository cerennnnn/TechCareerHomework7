//
//  UpdateToDoInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class UpdateToDoInteractor: PresenterToInteractorUpdateToDoProtocol {
    func updateToDo(item: String, category: String, toDoID: Int) {
        print("Update to do: \(item) - \(category) - \(toDoID)")
    }
    
    
}
