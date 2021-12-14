//
//  ViewController.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 10/05/1443 AH.
//

import UIKit

class BactListViewController: UITableViewController, AddDelegat {
    
    var items = ["somthimg","doing","Jeddah","somthing else"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Loooddeeedd")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected!!")
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddSegue"{
            let navegations = segue.destination as! UINavigationController
            let addItemsCon = navegations.topViewController as! AddItemsViewController
            addItemsCon.delgate = self
        } else if segue.identifier == "editSegue"{
            
            let navegations = segue.destination as! UINavigationController
            let addItemsCon = navegations.topViewController as! AddItemsViewController
            addItemsCon.delgate = self
            
            let indexpath = sender as! NSIndexPath
            let item = items[indexpath.row]
            addItemsCon.item = item
            addItemsCon.ind = indexpath
        }
        
    }
    func cancelButtonPressed(by contoller: AddItemsViewController) {
        print("I am cancel and o Presssed!!")
        dismiss(animated: true)
    }
    
    func itemSaved(by conroller: AddItemsViewController, with text: String, at indexPath: NSIndexPath?) {
        print("I am Save and o Presssed!! and receved the text = \(text)")
        
        if let inpth = indexPath {
            items[inpth.row] = text
        }else {
            items.append(text)
            
        }
        tableView.reloadData()
        dismiss(animated: true)
    }
}

