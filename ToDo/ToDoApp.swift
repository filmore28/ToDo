//
//  ToDoApp.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
