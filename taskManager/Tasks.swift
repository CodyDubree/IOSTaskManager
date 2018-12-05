//
//  Tasks.swift
//  taskManager
//
//  Created by Cody Dubree on 11/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import Foundation

class Task {
    
    enum CompletedTask {
        case checkedIn
        case checkedOut(dueDate: Date)
        init (date : Date?) {
            if let date = date {
                self = .checkedOut(dueDate: date)
            } else {
                self = .checkedIn
                
            }
        }
    }
    
    let title: String
    let description: String
    let dueDate: Date? = nil
    
    var completedTask: CompletedTask = .checkedIn
    
    
    init(title: String, description: String) {
        
        self.title = title
        self.description = description
        
    }
}
