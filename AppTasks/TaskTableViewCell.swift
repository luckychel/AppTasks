//
//  TaskTableViewCell.swift
//  AppTasks
//
//  Created by Александр Кукоба on 09.04.2023.
//

import UIKit


class TaskTableViewCell: UITableViewCell {

    //MARK: Properies
    var taskEditable: Bool = false
    var task: Task!
    var index: Int!
    
    //MARK: IBOutlets
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskCount: UILabel!
    
    @IBOutlet weak var taskEdit: UITextField!
    
    @IBOutlet weak var taskBtnSave: UIButton!
    
    var closure: ((Task, Int) -> ())?
    
    //MARK: Button action
    @IBAction func taskSave(_ sender: UIButton) {
        task.text = taskEdit.text ?? ""
        closure?(task, index)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ task: Task, _ index: Int) {
        self.task = task
        self.index = index
        
        self.taskEditable = task.taskEditable
        self.taskLabel.text = task.text
        self.taskCount.text = String(task.taskCount())
        
        self.display(task)
    }
    
    func display(_ task: Task){
        if (task.taskEditable) {
            self.taskLabel.isHidden = true
            self.taskCount.isHidden = true
            self.taskEdit.isHidden = false
            self.taskBtnSave.isHidden = false
        }
        else
        {
            self.taskLabel.isHidden = false
            self.taskCount.isHidden = false
            self.taskEdit.isHidden = true
            self.taskBtnSave.isHidden = true
        }
    }
    
   
}
