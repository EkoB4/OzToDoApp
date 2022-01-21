//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode  ? .dark : .light)
        }
    }
}
