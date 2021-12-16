//
//  AddItemsViewController.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 10/05/1443 AH.
//

import UIKit

class AddItemsViewController: UIViewController {
    
    weak var delgate: AddDelegat?
    var item: String?
    var ind: IndexPath?
    
    @IBOutlet weak var itemText: UITextField!

    @IBAction func CancelPressed(_ sender: UIButton) {
       // delgate?.cancelButtonPressed()
        
        print("Cancel Pressed")
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let txt = itemText.text!
        delgate?.itemSaved(with: txt, at: ind)
        
        self.navigationController?.popViewController(animated: true)
        print("Save Pressed")
        print("\(txt)")


    }
    override func viewDidLoad() {
        super.viewDidLoad()

        itemText.text = item
        print("IndexPath : \(ind)")

    }


    

}
