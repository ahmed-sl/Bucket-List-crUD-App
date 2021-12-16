//
//  ViewController.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 10/05/1443 AH.
//

import UIKit
import CoreData

class BactListViewController: UITableViewController, AddDelegat {
    
    var items = [BucktListItems]()
    weak var delgate: AddDelegat?
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fitchAllData()
        print("Loooddeeedd")
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].text!
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("selected!!")
//    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let nav2 = storyboard?.instantiateViewController(withIdentifier: "EditScreen") as! AddItemsViewController
        nav2.delgate = self
        nav2.ind = indexPath
        nav2.item = items[indexPath.row].text
        self.navigationController?.pushViewController(nav2, animated: true)
//        let updaetText = items[indexPath.row].text!
//          updateTask(oldTaskName: updaetText)

        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
//        let deletedText = items[indexPath.row].text!
//
//        delete(taskName: deletedText)
        tableView.reloadData()
    }
    
    func fitchAllData(){

        let requst = NSFetchRequest<BucktListItems>(entityName: "BucktListItems")
        
        do {
            items =  try managedObjectContext.fetch(requst)
            tableView.reloadData()
        }catch{
            print(error)
        }
    }
    
    func cancelButtonPressed() {
        print("I am cancel and o Presssed!!")
        dismiss(animated: true)
    }
    
    
    
    func itemSaved(with text: String, at indexPath: IndexPath?) {
        print("I am Save and o Presssed!! and receved the text = \(text)")
        
        if let inpth = indexPath,
           let name = items[inpth.row].text{
            
            
            
            updateTask(oldTaskName: name, newName: text)
        }else {
            saveTask(task: text)
        }
        
//        tableView.reloadData()
        dismiss(animated: true)
    }
    
    @IBAction func nextScreen(_ sender: UIBarButtonItem) {
        
        let editSc = storyboard?.instantiateViewController(withIdentifier: "EditScreen") as! AddItemsViewController
        editSc.delgate = self
        self.navigationController?.pushViewController(editSc, animated: true)
        
        
    }
    
    func saveTask(task: String) {
            //1. get updated app context
//            let context = getContext()
            
            //2. Creating NSManagedObject
            let taskItem = BucktListItems.init(context: managedObjectContext) // important
            taskItem.text = task
           
            
            //3. save context
            do {
                try managedObjectContext.save()
                fitchAllData()
            } catch {
                // error handling
                print(error.localizedDescription)
            }
        }
    func updateTask(oldTaskName:String, newName:String) {
         //   let context = getContext()
                    
            // update the task item array
            let request = NSFetchRequest<BucktListItems>.init(entityName: "BucktListItems")
            
            // query or filter
        
        
        
        let predecat = NSPredicate.init(format: "text==%@", oldTaskName)
            request.predicate = predecat
        do {
            // fetch
            let arr = try managedObjectContext.fetch(request)
            var item = arr.first
            // update
            item?.text = newName
            
            // save
            try managedObjectContext.save()
            // refresh the ui with updated data
            fitchAllData()
        } catch {
            print(error.localizedDescription)
        }
        }
    
   

    
}

