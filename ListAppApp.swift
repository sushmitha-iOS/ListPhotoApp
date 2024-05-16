//
//  ListAppApp.swift
//  ListApp
//
//  Created by Sushmitha Rani on 16/05/24.
//

import SwiftUI

@main
struct ListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
