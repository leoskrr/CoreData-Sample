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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shouldEditTask {
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
        
        //let titleText = titleTextField.text
        //let descText = descTextField.text
        
        if !shouldEditTask {
            //Chamar função para criar uma nova task no nosso container e mostrar alerta de sucesso ou erro
        } else {
            //Chamar função para atualizar a task no nosso container e mostrar alerta de sucesso ou erro
        }
    }
    
    //Função executada quando o botão de excluir task for pressionado
    @IBAction func deletePressedItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete task", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No, I am not.", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, I am.", style: .destructive, handler: {
            _ in
            
            self.titleTextField.text = ""
            self.descTextField.text = ""
            self.shouldEditTask = false
            self.trashBarButton.isEnabled = false
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
