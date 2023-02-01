//
//  UpdateToDoProtocols.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

protocol ViewToPresenterUpdateToDoProtocol {
    var updateToDoInteractor: PresenterToInteractorUpdateToDoProtocol? { get set }
    func updateToDoFunc(item: String, category: String, toDoID: Int)
}

protocol PresenterToInteractorUpdateToDoProtocol {
    func updateToDo(item: String, category: String, toDoID: Int)
}

protocol PresenterToRouterUpdateToDoProtocol {
    static func createModule(ref: UpdateToDoVC)
}
