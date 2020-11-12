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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Função de quando o botão "Create" for apertado
    @IBAction func createTaskAction(_ sender: UIButton) {
        let taskModel = TaskModel.shared
        
        let titleText = titleTextField.text
        let descText = descTextField.text
        
        let newTask = taskModel.createTask(title: titleText, desc: descText)
        
        if let createdTask = newTask {
            print("Task criada!!!!")
            dump(createdTask)
        } else {
            print("Erro :(")
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

}
