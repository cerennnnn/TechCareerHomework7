//
//  UpdateToDoVC.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import UIKit

class UpdateToDoVC: UIViewController {

    @IBOutlet var categoryTextField: UITextField!
    @IBOutlet var toDoTextField: UITextField!
    
    var toDoItem: ToDoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoItem {
            toDoTextField.text = toDo.toDo
            categoryTextField.text = toDo.category
        }
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        if let item = toDoTextField.text, let category = categoryTextField.text, let toDo = toDoItem {
            if toDoItem?.toDoID != nil {
                updateToDo(item: item, category: category, toDoID: toDo.toDoID!)
            }
        }
    }
    
    func updateToDo(item: String, category: String, toDoID: Int) {
        print("Update to do: \(item) - \(category) - \(toDoID)")
    }
    
}
