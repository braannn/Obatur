//
//  Medicines+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Medicines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicines> {
        return NSFetchRequest<Medicines>(entityName: "Medicines")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Int64
    @NSManaged public var prescription_item: Prescription_items?
    @NSManaged public var category: Categories?

}

extension Medicines : Identifiable {

}
