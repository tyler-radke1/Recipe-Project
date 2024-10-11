//
//  SettingsView.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/10/24.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var allRecipes = AllRecipes.shared
    
    var body: some View {
        HStack {
            Text("Data to use: ")
            
            Picker("Endpoint to use", selection: $allRecipes.endPointToUse) {
                ForEach(EndPoint.allCases, id: \.self) { endpoint in
                    Text(endpoint.rawValue)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
