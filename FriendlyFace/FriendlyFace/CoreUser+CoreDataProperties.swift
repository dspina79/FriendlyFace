//
//  CoreUser+CoreDataProperties.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/10/21.
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
    @NSManaged public var friends: NSSet?

    var wrappedName: String {
        self.name ?? "Uknown Name"
    }
    
    var wrappedAddress: String {
        self.address ?? "Uknown Address"
    }
    
    var wrappedEmail: String {
        self.email ?? ""
    }
    
    var wrappedRegisteredDate: String {
        self.registeredDate ?? ""
    }
    
    var wrappedAbout: String {
        self.about ?? ""
    }
    
    var wrappedComany: String {
        self.company ?? ""
    }
    
    var wrappedTags: [String] {
        self.tags?.components(separatedBy: ",") ?? [String]()
    }
    
    var wrappedId: UUID {
        self.id ?? UUID()
    }
    
    var wrappedFriends: [CoreFriend] {
        let fs = self.friends as? Set<CoreFriend> ?? []
        return fs.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    
    func setrecord(from usr: User, with context: NSManagedObjectContext) {
        print("In set record for \(usr.id)")
        self.id = usr.id
        self.name = usr.name
        self.address = usr.address
        self.age = Int16(usr.age)
        self.tags = usr.tags.joined(separator: ",")
        self.friends = NSSet()
        
        for f in usr.friends {
            let cf = CoreFriend(context: context)
            cf.id = f.id
            cf.name = f.name
            cf.user = self
        }
        
        self.about = usr.about
        self.company = usr.company
        self.email = usr.email
        self.registeredDate = usr.registered
    }
}

// MARK: Generated accessors for friends
extension CoreUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CoreFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CoreFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CoreUser : Identifiable {

}
