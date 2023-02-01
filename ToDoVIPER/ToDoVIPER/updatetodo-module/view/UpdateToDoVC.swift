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
    var updateToDoPresenterObject: ViewToPresenterUpdateToDoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoItem {
            toDoTextField.text = toDo.toDo
            categoryTextField.text = toDo.category
        }
        
        UpdateToDoRouter.createModule(ref: self)
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        if let item = toDoTextField.text, let category = categoryTextField.text, let toDo = toDoItem {
            if toDoItem?.toDoID != nil {
                updateToDoPresenterObject?.updateToDoFunc(item: item, category: category, toDoID: toDo.toDoID!)
            }
        }
    }
}
