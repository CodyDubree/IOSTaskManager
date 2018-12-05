//
//  TaskCell.swift
//  taskManager
//
//  Created by Cody Dubree on 11/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class LibraryCell : UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var GenreLabel: UILabel!
    
    @IBOutlet weak var AvailibilityView: UIView!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var DueDateLabel: UILabel!
    
    
    
    
    func setup( task : Task) {
        TitleLabel.text = task.title
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        DueDateLabel.text = dateFormatter.dateFormat
        
    }
    
}


