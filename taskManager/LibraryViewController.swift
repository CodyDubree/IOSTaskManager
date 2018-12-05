//
//  LibraryViewController.swift
//  taskManager
//
//  Created by Cody Dubree on 11/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    let library = Library.sharedInstance
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library.task.append(Task(title: "Fallout", description: "10/10"))
        tableView.reloadData()
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.task.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath) as! LibraryCell
        
        let task = library.task[indexPath.row]
        cell.setup(task : task)
        
        return cell
    }
    func checkOut(at indexPath: IndexPath) {
        let task = self.library.task[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        Task.CompletedTask = .checkedOut(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let task = self.library.task[indexPath.row]
        Task.CompletedTask = .checkedIn
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    // Here the tableview is asking if any row should have an "edit" action.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.task.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let task = library.task[indexPath.row]
        
        // If the game is checked out, we create and return the check in action.
        // If the game is checked in, we create and return the check out action.
        
        switch task.completedTask {
        case .checkedIn:
            let completed = UITableViewRowAction(style: .normal, title: "Completed") { _, indexPath in
                
                self.checkOut(at: indexPath)
                
            }
            
            return [completed, deleteAction]
            
        case .checkedOut:
            let incompleted = UITableViewRowAction(style: .normal, title: "Incomplete") { _, indexPath in
                self.checkIn(at: indexPath)
            }
            
            return [incompleted, deleteAction]
            
        }
    }
    
}

