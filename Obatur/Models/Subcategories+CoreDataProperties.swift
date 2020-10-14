//
//  Subcategories+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Subcategories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subcategories> {
        return NSFetchRequest<Subcategories>(entityName: "Subcategories")
    }

    @NSManaged public var name: String?
    @NSManaged public var category: Categories?

}

extension Subcategories : Identifiable {

}
