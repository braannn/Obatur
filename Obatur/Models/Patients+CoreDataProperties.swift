//
//  Patients+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Patients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patients> {
        return NSFetchRequest<Patients>(entityName: "Patients")
    }

    @NSManaged public var name: String?
    @NSManaged public var dob: Date?
    @NSManaged public var prescription: Prescriptions?

}

extension Patients : Identifiable {

}
