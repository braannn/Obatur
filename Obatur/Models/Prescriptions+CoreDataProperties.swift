//
//  Prescriptions+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Prescriptions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prescriptions> {
        return NSFetchRequest<Prescriptions>(entityName: "Prescriptions")
    }

    @NSManaged public var created_at: Date?
    @NSManaged public var price: Int64
    @NSManaged public var patient: Patients?
    @NSManaged public var prescription_items: NSSet?
    @NSManaged public var doctor: Doctors?

}

// MARK: Generated accessors for prescription_items
extension Prescriptions {

    @objc(addPrescription_itemsObject:)
    @NSManaged public func addToPrescription_items(_ value: Prescription_items)

    @objc(removePrescription_itemsObject:)
    @NSManaged public func removeFromPrescription_items(_ value: Prescription_items)

    @objc(addPrescription_items:)
    @NSManaged public func addToPrescription_items(_ values: NSSet)

    @objc(removePrescription_items:)
    @NSManaged public func removeFromPrescription_items(_ values: NSSet)

}

extension Prescriptions : Identifiable {

}
