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
    
    var addToDoPresenterObject: ViewToPresenterAddToDoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddToDoRouter.createModule(ref: self)

    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let item = toDoTextField.text, let category = categoryTextField.text {
            addToDoPresenterObject?.addToDoFunc(item: item, category: category)
        }
    }
}
