//
//  User.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    static var emptyUser: User {
        return User(id: UUID(), isActive: false, name: "Not Found", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: [String](), friends: [Friend]())
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
