//
//  TaskModel.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import Foundation
import CoreData

struct TaskRepository {
    static let shared = TaskRepository()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CD_ToDo")
        container.loadPersistentStores {
            storeDescription, error in
            
            if let foundError = error {
                fatalError("Error: \(foundError)")
            }
        }
        
        return container
    }()
    
    func createTask(title: String?, desc: String?) -> Task? {
        let context = persistentContainer.viewContext
        
        let newTask = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as! Task
        
        newTask.title = title
        newTask.desc = desc
        
        do {
            try context.save()
            return newTask
        } catch let createError {
            print("Failed to create: \(createError)")
        }
        
        return nil
    }
    
    func fetchTasks() -> [Task]? {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        
        do {
            let details = try context.fetch(fetchRequest)
            return details
        } catch let fetchError {
            print("Failed to fetch: \(fetchError)")
        }
        
        return nil
    }
    
    func updateTask(task: Task) -> Task? {
        let context = persistentContainer.viewContext
        
        do{
            try context.save()
            return task
        } catch let updateError {
            print("Failed to update: \(updateError)")
        }
        
        return nil
    }
    
    func deleteTask(task: Task){
        let context = persistentContainer.viewContext
        context.delete(task)
        
        do{
            try context.save()
        }catch let saveError{
            print("Failed to delete: \(saveError)")
        }
    }
}
