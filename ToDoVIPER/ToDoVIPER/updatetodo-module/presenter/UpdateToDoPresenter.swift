//
//  UpdateToDoPresenter.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class UpdateToDoPresenter: ViewToPresenterUpdateToDoProtocol {
    var updateToDoInteractor: PresenterToInteractorUpdateToDoProtocol?
    
    func updateToDoFunc(item: String, category: String, toDoID: Int) {
        updateToDoInteractor?.updateToDo(item: item, category: category, toDoID: toDoID)
    }
}
