//
//  CoreUser+CoreDataProperties.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/9/21.
//
//

import Foundation
import CoreData


extension CoreUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreUser> {
        return NSFetchRequest<CoreUser>(entityName: "CoreUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var email: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var registeredDate: String?
    @NSManaged public var about: String?
    @NSManaged public var company: String?
    @NSManaged public var tags: String?
    @NSManaged public var id: UUID?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var attribute1: NSObject?
    @NSManaged public var friends: CoreFriend?

    
}

extension CoreUser : Identifiable {

}
