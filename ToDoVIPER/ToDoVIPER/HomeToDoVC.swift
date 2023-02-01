//
//  ViewController.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import UIKit

class HomeToDoVC: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var toDoList = [ToDoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let i1 = ToDoModel(toDoID: 1, category: "education", toDo: "Study iOS for 2 hours.")
        let i2 = ToDoModel(toDoID: 2, category: "grocery", toDo: "Buy some milk.")
        
        toDoList = [i1, i2]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateToDo" {
            if let toDo = sender as? ToDoModel {
                let destinationVC = segue.destination as! UpdateToDoVC
                destinationVC.toDoItem = toDo
            }
        }
    }
}

extension HomeToDoVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching \(searchText)")
    }
}

extension HomeToDoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTableViewCell
        let item = toDoList[indexPath.row]
        
        cell.categoryLabel.text = item.category
        cell.toDoItem.text = item.toDo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoList[indexPath.row]
        performSegue(withIdentifier: "updateToDo", sender: item)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {
            contextualAction, view, bool in
            let item = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Careful!", message: "Are you sure you want to delete your to do item?", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
            let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { action in
                print("\(item.toDoID!) deleted.")
            }
            
            alert.addAction(cancelButton)
            alert.addAction(deleteButton)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
