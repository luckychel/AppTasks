//
//  Task.swift
//  AppTasks
//
//  Created by Александр Кукоба on 09.04.2023.
//

import Foundation

class Task {
    
    //MARK: Properies
    var text: String = ""
    var taskEditable: Bool = false
    private var tasks: [Task] = []
    
    //MARK: Init
    init(_ text: String, _ taskEditable: Bool) {
        self.text = text
        self.taskEditable = taskEditable
    }
    
    //MARK: Methods
    func taskCount() -> Int {
        return tasks.count
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    func deleteTask(_ index: Int) {
        self.tasks.remove(at: index)
    }
    func getTasks() -> [Task] {
        return tasks
    }

    
}
