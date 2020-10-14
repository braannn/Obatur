//
//  Specialties+CoreDataProperties.swift
//  Obatur
//
//  Created by Jason Yang on 15/10/20.
//
//

import Foundation
import CoreData


extension Specialties {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Specialties> {
        return NSFetchRequest<Specialties>(entityName: "Specialties")
    }

    @NSManaged public var name: String?
    @NSManaged public var doctor: Doctors?

}

extension Specialties : Identifiable {

}
