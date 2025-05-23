//
//  Habit_JournalApp.swift
//  Habit_Journal
//
//  Created by Abbas on 23/05/2025.
//

import SwiftUI

@main
struct Habit_JournalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
