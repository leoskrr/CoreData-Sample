//
//  ViewController.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: [Task]?
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tasks != nil {
            return tasks!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        if tasks != nil {
            let task = tasks![indexPath.row]
            cell.fillCellWithTitle(task.title)
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasks = TaskModel.shared.fetchTasks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let createTaskVC = segue.destination as! CreateTaskViewController
        
        if segue.identifier == "editTaskSegue" {
            guard let selectedCellIndexPath = tasksTableView.indexPathForSelectedRow else {
                return
            }
            
            let index = selectedCellIndexPath.row
            let selectedTask = tasks![index]
            
            createTaskVC.shouldEditTask = true
            createTaskVC.editTask = selectedTask
        } else {
            createTaskVC.shouldEditTask = false
            createTaskVC.editTask = nil
        }
    }
}
