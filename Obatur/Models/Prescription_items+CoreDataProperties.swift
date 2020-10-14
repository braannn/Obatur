//
//  Prescription_items+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Prescription_items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prescription_items> {
        return NSFetchRequest<Prescription_items>(entityName: "Prescription_items")
    }

    @NSManaged public var name: String?
    @NSManaged public var instruction: String?
    @NSManaged public var prescription: Prescriptions?
    @NSManaged public var medicine: Medicines?

}

extension Prescription_items : Identifiable {

}
