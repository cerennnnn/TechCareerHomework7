//
//  HomePageInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getAllToDos() {
        
        var toDoList = [ToDoModel]()
        
        let i1 = ToDoModel(toDoID: 1, category: "education", toDo: "Study iOS for 2 hours.")
        let i2 = ToDoModel(toDoID: 2, category: "grocery", toDo: "Buy some milk.")
        
        toDoList = [i1, i2]
        
        //sends data to presenter layer
        homePagePresenter?.sendDataToPresenter(toDos: toDoList)
    }
    
    func searchToDo(searchText: String) {
        print("Searching \(searchText)")
    }
    
    func deleteToDo(toDoID: Int) {
        print("\(toDoID) deleted.")
    }
    
    
}
