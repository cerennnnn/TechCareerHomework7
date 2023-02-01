//
//  AddToDoInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class AddToDoInteractor: PresenterToInteractorAddToDoProtocol {
    func addToDo(item: String, category: String) {
        print("Add to do: \(item) - \(category)")
    }
    
    
}
