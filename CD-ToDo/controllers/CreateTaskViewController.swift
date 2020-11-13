//
//  CreateTaskViewController.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var trashBarButton: UIBarButtonItem!
    
    var shouldEditTask: Bool = false
    var editTask: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shouldEditTask {
            guard let task = editTask else {
                return
            }
            
            titleTextField.text = task.title
            descTextField.text = task.desc
            
            trashBarButton.isEnabled = true
        }
    }
    
    //Função executada quando o botão "done" for pressionado
    @IBAction func handleDoneButton(_ sender: UIButton) {
        let taskModel = TaskModel.shared
        
        let titleText = titleTextField.text
        let descText = descTextField.text
        
        if !shouldEditTask {
            //Chamar função para criar uma nova task no nosso container
            createTaskWith(title: titleText, desc: descText, shared: taskModel)
        } else {
            //Chamar função para atualizar a task no nosso container
            updateTaskWith(newTitle: titleText, newDesc: descText, shared: taskModel)
        }
    }
    
    func createTaskWith(title: String?, desc: String?, shared: TaskModel){
        let newTask = shared.createTask(title: title, desc: desc)
        
        if let createdTask = newTask {
            print("Task criada!!!!")
            dump(createdTask)
        } else {
            print("Erro :(")
        }
    }
    
    func updateTaskWith(newTitle: String?, newDesc: String?, shared: TaskModel) {
        guard let task = editTask else {
            return
        }
        
        task.title = newTitle
        task.desc = newDesc
        
        let updateTask = shared.updateTask(task: task)
        
        if let updatedTask = updateTask {
            print("Task atualizada!!!!")
            dump(updatedTask)
        } else {
            print("Erro :(")
        }
    }
    
    //Função executada quando o botão de excluir task for pressionado
    @IBAction func deleteItemPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete task", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No, I am not.", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, I am.", style: .destructive, handler: {
            _ in
            guard let task = self.editTask else {
                return
            }
            
            let taskModel = TaskModel.shared
            taskModel.deleteTask(task: task)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
