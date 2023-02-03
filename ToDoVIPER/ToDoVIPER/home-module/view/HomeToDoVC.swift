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
    var homePagePresenterObject: ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //copy db when view first show up
        copyDB()
        
        HomePageRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.getAllToDosFunc() //will trigger presenter's func which triggers interactor
        
    }
    
    func copyDB() {
        let path = Bundle.main.path(forResource: "toDos", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let copyTo = URL(fileURLWithPath: targetPath).appendingPathComponent("toDos.sqlite")
        
        if fileManager.fileExists(atPath: copyTo.path) {
            print("DB already exists.")
        } else {
            do {
                try fileManager.copyItem(atPath: path!, toPath: copyTo.path)
            } catch {
                
            }
        } 
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

extension HomeToDoVC: PresenterToViewHomePageProtocol {
    func sendDataToView(toDos: Array<ToDoModel>) {
        self.toDoList = toDos
        tableView.reloadData()
    }
}

extension HomeToDoVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePagePresenterObject?.searchToDoFunc(searchText: searchText)
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
                self.homePagePresenterObject?.deleteToDoFunc(toDoID: item.toDoID!)
            }
            
            alert.addAction(cancelButton)
            alert.addAction(deleteButton)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
