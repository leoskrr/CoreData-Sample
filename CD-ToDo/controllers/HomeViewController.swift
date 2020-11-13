//
//  ViewController.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Trocar o tipo de "Any" para o tipo da nossa entidade de task
    var tasks: [Any] = []
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        //Completar o preenchimento da célula de task
        //let task = tasks[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTasksArray()
        //tasksTableView.reloadData()
    }
        
    //Função usada para adicionar as tasks do Core Data na variável "tasks"
    func setUpTasksArray(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let createTaskVC = segue.destination as! HandleTaskViewController
        
        if segue.identifier == "editTaskSegue" {
            //guard let selectedCellIndexPath = tasksTableView.indexPathForSelectedRow else {
            //    return
            //}
            //
            //let index = selectedCellIndexPath.row
            //let selectedTask = tasks[index]
            
            createTaskVC.shouldEditTask = true
        } else {
            createTaskVC.shouldEditTask = false
        }
    }
}
