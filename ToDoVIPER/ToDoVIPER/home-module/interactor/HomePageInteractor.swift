//
//  HomePageInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("toDos.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
    
    func getAllToDos() {
        
        var toDoList = [ToDoModel]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while rs.next() {
                let todo = ToDoModel(toDoID: Int(rs.string(forColumn: "id")), category: rs.string(forColumn: "category"), toDo: rs.string(forColumn: "todo"))
                
                toDoList.append(todo)
            }
            
            //sends data to presenter layer
            homePagePresenter?.sendDataToPresenter(toDos: toDoList)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchToDo(searchText: String) {
        var toDoList = [ToDoModel]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM toDos WHERE todo like '%\(searchText)%'", values: nil)
            
            while rs.next() {
                let todo = ToDoModel(toDoID: Int(rs.string(forColumn: "id")), category: rs.string(forColumn: "category"), toDo: rs.string(forColumn: "todo"))
                
                toDoList.append(todo)
            }
            
            homePagePresenter?.sendDataToPresenter(toDos: toDoList)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteToDo(toDoID: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE from toDos WHERE id = ?", values: [toDoID])
            getAllToDos()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
