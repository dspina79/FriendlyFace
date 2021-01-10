//
//  CoreFriend+CoreDataProperties.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/9/21.
//
//

import Foundation
import CoreData


extension CoreFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreFriend> {
        return NSFetchRequest<CoreFriend>(entityName: "CoreFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var user: CoreUser?

}

extension CoreFriend : Identifiable {

}
