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
    
    //MARK: IBOutlets
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskCount: UILabel!
    
    @IBOutlet weak var taskEdit: UITextField!
    
    @IBOutlet weak var taskBtnSave: UIButton!
    //MARK: Button action
    @IBAction func taskSave(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if (taskEditable) {
            taskLabel.isHidden = true
            taskCount.isHidden = true
            taskEdit.isHidden = false
            taskBtnSave.isHidden = false
        }
        else
        {
            taskLabel.isHidden = false
            taskCount.isHidden = false
            taskEdit.isHidden = true
            taskBtnSave.isHidden = true
        }
    }
    
}
