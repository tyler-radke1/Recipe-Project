//
//  RecipesViewModel.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/10/24.
//

import Foundation
import SwiftUI
import Kingfisher

extension RecipesView {
    @MainActor
    class ViewModel: ObservableObject {
        enum SortOption: String, CaseIterable {
            case name = "Name"
            case cuisine = "Cuisine"
        }
        
        @Published var recipes: [Recipe] = []
        
        @Published var searchString = "" {
            didSet {
                print(searchString)
            }
        }
        
        @Published var sortOption: SortOption = .name
        
        var allRecipes = AllRecipes.shared
        
        var sortedRecipes: [Recipe] {
            var recipesToReturn: [Recipe] = recipes
            
            if !searchString.isEmpty {
                recipesToReturn = recipes.filter{ recipe in
                    recipe.name.lowercased().contains(searchString.lowercased()) || recipe.cuisine.lowercased().contains(searchString.lowercased())
                }
            }
            switch sortOption {
            case .name:
                return recipesToReturn.sorted { $0.name < $1.name }
            case .cuisine:
                return recipesToReturn.sorted { $0.cuisine < $1.cuisine }
            }
        }
        
        func getRecipes() async {
            self.recipes = await allRecipes.getRecipes()
        }
    }
}
