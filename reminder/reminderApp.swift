//
//  reminderApp.swift
//  reminder
//
//  Created by Enrico Madonna on 13/11/23.
//
import SwiftData
import SwiftUI

@main
struct reminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Reminder.self)

    }
}
