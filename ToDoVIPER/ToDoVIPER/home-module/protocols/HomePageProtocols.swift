//
//  HomePageProtocols.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

//carrier protocols -> from right to left, main protocols -> from left to right
protocol ViewToPresenterHomePageProtocol {
    //presenter layer
    //bc it's going to trigger both interactor and view, 2 objects are needed.
    
    var homePageInteractor: PresenterToInteractorHomePageProtocol? { get set }
    var homePageView: PresenterToViewHomePageProtocol? { get set }
    
    func getAllToDosFunc()
    func searchToDoFunc(searchText: String)
    func deleteToDoFunc(toDoID: Int)
}

protocol PresenterToInteractorHomePageProtocol {
    //interactor layer
    
    var homePagePresenter: InteractorToPresenterHomePageProtocol? { get set }
    
    func getAllToDos()
    func searchToDo(searchText: String)
    func deleteToDo(toDoID: Int)
}

protocol InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(toDos: Array<ToDoModel>)
}

protocol PresenterToViewHomePageProtocol {
    func sendDataToView(toDos: Array<ToDoModel>)
}

protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomeToDoVC)
}
