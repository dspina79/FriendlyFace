//
//  User.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import Foundation

struct User: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
