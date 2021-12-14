//
//  AddDelegat.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 10/05/1443 AH.
//

import Foundation

protocol AddDelegat: AnyObject {
    func itemSaved(by conroller: AddItemsViewController, with text: String, at indexPath: NSIndexPath?)
    
    func cancelButtonPressed(by conroller: AddItemsViewController)
}
