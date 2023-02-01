//
//  AddToDoVC.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import UIKit

class AddToDoVC: UIViewController {
    
    @IBOutlet var toDoTextField: UITextField!
    @IBOutlet var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let item = toDoTextField.text, let category = categoryTextField.text {
            addToDo(item: item, category: category)
        }
    }
    
    func addToDo(item: String, category: String) {
        print("Add to do: \(item) - \(category)")
    }
    
}
