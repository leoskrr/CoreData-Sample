//
//  CreateTaskViewController.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class HandleTaskViewController: UIViewController {
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
    
    func displayAlertWith(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    //Função executada quando o botão "done" for pressionado
    @IBAction func handleDoneButton(_ sender: UIButton) {
        let taskModel = TaskRepository.shared
        
        let titleText = titleTextField.text
        let descText = descTextField.text
        
        if !shouldEditTask {
            //Chamar função para criar uma nova task no nosso container e mostrar alerta de sucesso ou erro
            createTaskWith(title: titleText, desc: descText, shared: taskModel)
        } else {
            //Chamar função para atualizar a task no nosso container e mostrar alerta de sucesso ou erro
            updateTaskWith(newTitle: titleText, newDesc: descText, shared: taskModel)
        }
    }
    
    func createTaskWith(title: String?, desc: String?, shared: TaskRepository){
        let newTask = shared.createTask(title: title, desc: desc)
        
        if let _ = newTask {
            displayAlertWith(title: "Success", message: "New task created successfully")
        } else {
            displayAlertWith(title: "Error", message: "Internal error")
        }
    }
    
    func updateTaskWith(newTitle: String?, newDesc: String?, shared: TaskRepository) {
        guard let task = editTask else {
            return
        }
        
        task.title = newTitle
        task.desc = newDesc
        
        let updateTask = shared.updateTask(task: task)
        
        if let _ = updateTask {
            displayAlertWith(title: "Success", message: "Task updated successfully")
        } else {
            displayAlertWith(title: "Error", message: "Internal error")
        }
    }
    
    //Função executada quando o botão de excluir task for pressionado
    @IBAction func deletePressedItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete task", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No, I am not.", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, I am.", style: .destructive, handler: {
            _ in
            guard let task = self.editTask else {
                return
            }
            
            let taskModel = TaskRepository.shared
            taskModel.deleteTask(task: task)
            
            self.titleTextField.text = ""
            self.descTextField.text = ""
            self.shouldEditTask = false
            self.trashBarButton.isEnabled = false
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
