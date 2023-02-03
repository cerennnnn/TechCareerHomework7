//
//  UpdateToDoInteractor.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import Foundation

class UpdateToDoInteractor: PresenterToInteractorUpdateToDoProtocol {
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("toDos.sqlite")
        db = FMDatabase(path: dbURL.path)
    }
 
    func updateToDo(item: String, category: String, toDoID: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE toDos SET todo = ?, category = ? WHERE id = ?", values: [item, category, toDoID])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
