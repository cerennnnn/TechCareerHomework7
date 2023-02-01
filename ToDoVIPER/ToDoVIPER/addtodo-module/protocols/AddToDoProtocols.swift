//
//  AddToDoProtocols.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

protocol ViewToPresenterAddToDoProtocol {
    var addToDoInteractor: PresenterToInteractorAddToDoProtocol? { get set }
    func addToDoFunc(item: String, category: String)
}

protocol PresenterToInteractorAddToDoProtocol {
    func addToDo(item: String, category: String)
}

//delegation protocol
protocol PresenterToRouterAddToDoProtocol {
    static func createModule(ref: AddToDoVC)
}
