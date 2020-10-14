//
//  Doctors+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Doctors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doctors> {
        return NSFetchRequest<Doctors>(entityName: "Doctors")
    }

    @NSManaged public var name: String?
    @NSManaged public var specialty: Specialties?
    @NSManaged public var prescriptions: NSSet?

}

// MARK: Generated accessors for prescriptions
extension Doctors {

    @objc(addPrescriptionsObject:)
    @NSManaged public func addToPrescriptions(_ value: Prescriptions)

    @objc(removePrescriptionsObject:)
    @NSManaged public func removeFromPrescriptions(_ value: Prescriptions)

    @objc(addPrescriptions:)
    @NSManaged public func addToPrescriptions(_ values: NSSet)

    @objc(removePrescriptions:)
    @NSManaged public func removeFromPrescriptions(_ values: NSSet)

}

extension Doctors : Identifiable {

}
