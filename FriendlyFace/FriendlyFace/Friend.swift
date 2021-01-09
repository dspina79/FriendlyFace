//
//  Friend.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
