//
//  Categories+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var name: String?
    @NSManaged public var subcategoryies: NSSet?
    @NSManaged public var medicines: NSSet?

}

// MARK: Generated accessors for subcategoryies
extension Categories {

    @objc(addSubcategoryiesObject:)
    @NSManaged public func addToSubcategoryies(_ value: Subcategories)

    @objc(removeSubcategoryiesObject:)
    @NSManaged public func removeFromSubcategoryies(_ value: Subcategories)

    @objc(addSubcategoryies:)
    @NSManaged public func addToSubcategoryies(_ values: NSSet)

    @objc(removeSubcategoryies:)
    @NSManaged public func removeFromSubcategoryies(_ values: NSSet)

}

// MARK: Generated accessors for medicines
extension Categories {

    @objc(addMedicinesObject:)
    @NSManaged public func addToMedicines(_ value: Medicines)

    @objc(removeMedicinesObject:)
    @NSManaged public func removeFromMedicines(_ value: Medicines)

    @objc(addMedicines:)
    @NSManaged public func addToMedicines(_ values: NSSet)

    @objc(removeMedicines:)
    @NSManaged public func removeFromMedicines(_ values: NSSet)

}

extension Categories : Identifiable {

}
