//
//  TasksTableViewController.swift
//  AppTasks
//
//  Created by Александр Кукоба on 09.04.2023.
//

import UIKit

class TasksTableViewController: UITableViewController {

    //MARK: Properties
    var task: Task?
    var index: Int?
    
    var tasks: [Task] = []
    
    var closure: (() -> ())?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = task?.text ?? "Задачи"
        
        if (self.task != nil) {
            self.tasks = task!.getTasks()
        }

        self.tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
    
    //MARK: Button actions
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        let task = Task("", true);
        tasks.append(task)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(tasks[indexPath.row], indexPath.row)
        
        cell.closure = {[weak self] t, index in
            guard let self = self else {
                return
            }
            if (t.text.isEmpty) {
                self.showErrorAlert()
            }
            else
            {
                t.taskEditable = false
                self.tasks[index] = t
                if (self.task != nil)
                {
                    self.task!.addTask(t)
                    self.closure?()
                }
                self.tableView.reloadData()
            }
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        
        if (!task.taskEditable) {
            let vc: TasksTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "TasksTableViewController") as! TasksTableViewController
            vc.task = tasks[indexPath.row]
            vc.closure = {[weak self] in
                guard let self = self else {
                    return
                }
                self.tableView.reloadData()
            }
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if (tasks[indexPath.row].taskEditable) {
//            return false
//        }
//        else {
            return true
        //}
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Ошибка", message: "Введите текст задачи", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "ОК", style: .default) { action in
            self.dismiss(animated: true)
        }
        alertController.addAction(action1)
        present(alertController, animated: true)
    }

}
