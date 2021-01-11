//
//  CoreFriend+CoreDataProperties.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/10/21.
//
//

import Foundation
import CoreData


extension CoreFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreFriend> {
        return NSFetchRequest<CoreFriend>(entityName: "CoreFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CoreUser?
    
    var wrappedId: UUID {
        self.id ?? UUID()
    }
    
    var wrappedName: String {
        self.name ?? ""
    }

}

extension CoreFriend : Identifiable {

}
