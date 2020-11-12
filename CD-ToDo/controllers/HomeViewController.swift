//
//  ViewController.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    var tasks: [Task]?
    
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
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasks = TaskModel.shared.fetchTasks()
    }
}
