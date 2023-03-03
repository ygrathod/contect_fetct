//
//  Contacts+CoreDataProperties.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 11/11/22.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var image: Data?

}

extension Contacts : Identifiable {

}
