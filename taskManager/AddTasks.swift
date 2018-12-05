//
//  AddTasks.swift
//  taskManager
//
//  Created by Cody Dubree on 11/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit
class AddGameViewController: UIViewController {
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.task.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
}
