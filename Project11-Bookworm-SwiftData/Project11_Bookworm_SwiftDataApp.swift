//
//  Project11_Bookworm_SwiftDataApp.swift
//  Project11-Bookworm-SwiftData
//
//
import SwiftData
import SwiftUI

@main
struct Project11_Bookworm_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
