//
//  BucktListItems+CoreDataProperties.swift
//  Bucket List crUD App
//
//  Created by Ahmed.sl on 11/05/1443 AH.
//
//

import Foundation
import CoreData


extension BucktListItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BucktListItems> {
        return NSFetchRequest<BucktListItems>(entityName: "BucktListItems")
    }

    @NSManaged public var text: String?

}

extension BucktListItems : Identifiable {

}
