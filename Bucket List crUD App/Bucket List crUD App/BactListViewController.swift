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
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //fitchAllData()
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
        self.navigationController?.pushViewController(nav2, animated: true)

        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
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
    
    
    
    func itemSaved(with text: String, at indexPath: NSIndexPath?) {
        print("I am Save and o Presssed!! and receved the text = \(text)")
        
        if let inpth = indexPath {
            let item = items[inpth.row]
            item.text = text
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

    
}

