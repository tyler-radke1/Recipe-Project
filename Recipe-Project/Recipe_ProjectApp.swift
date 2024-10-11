//
//  Recipe_ProjectApp.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/10/24.
//

import SwiftUI

@main
struct Recipe_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Recipes", systemImage: "list.bullet.circle") {
                    RecipesView()
                    }

                    Tab("Settings", systemImage: "gear.circle") {
                        SettingsView()
                    }
            }
        }
    }
}
