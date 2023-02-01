//
//  AddToDoPresenter.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class AddToDoPresenter: ViewToPresenterAddToDoProtocol {
    var addToDoInteractor: PresenterToInteractorAddToDoProtocol?
    
    func addToDoFunc(item: String, category: String) {
        addToDoInteractor?.addToDo(item: item, category: category)
    }
    
    
}
