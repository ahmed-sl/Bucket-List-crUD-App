//
//  AddItemsViewController.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 10/05/1443 AH.
//

import UIKit

class AddItemsViewController: UITableViewController {
    
    weak var delgate: AddDelegat?
    var item: String?
    var ind: NSIndexPath?
    
    @IBOutlet weak var itemText: UITextField!
    
    @IBAction func CancelPressed(_ sender: UIBarButtonItem) {
        delgate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let txt = itemText.text!
        delgate?.itemSaved(by: self, with: txt, at: ind)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        itemText.text = item
        
    }
    

    

}
