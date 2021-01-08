//
//  FriendlyFaceApp.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import SwiftUI

@main
struct FriendlyFaceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
