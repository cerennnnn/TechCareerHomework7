//
//  HomePagePresenter.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol {
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    
    var homePageView: PresenterToViewHomePageProtocol?
    
    func getAllToDosFunc() {
        homePageInteractor?.getAllToDos() //it'll run getAllToDo func in interactor.
    }
    
    func searchToDoFunc(searchText: String) {
        homePageInteractor?.searchToDo(searchText: searchText)
    }
    
    func deleteToDoFunc(toDoID: Int) {
        homePageInteractor?.deleteToDo(toDoID: toDoID)
    }
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(toDos: Array<ToDoModel>) {
        homePageView?.sendDataToView(toDos: toDos)
    }
}
