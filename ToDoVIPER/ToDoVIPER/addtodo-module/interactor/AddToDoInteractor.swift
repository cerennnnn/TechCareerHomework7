//
//  AddToDoInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class AddToDoInteractor: PresenterToInteractorAddToDoProtocol {
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("toDos.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
 
    func addToDo(item: String, category: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO toDos (todo, category) VALUES (?, ?)", values: [item, category])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
