//
//  AllRecipes.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/9/24.
//

import Foundation
import SwiftUI

enum EndPoint: String, CaseIterable {
    case allRecipes = "All Recipes"
    case malformedData = "Malformed Data"
    case emptyData = "Empty Data"
    
    var url: URL? {
        switch self {
        case .allRecipes:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        case .malformedData:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        case .emptyData:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        }
    }
}

class AllRecipes: ObservableObject {
    static let shared = AllRecipes()
    
    @Published var endPointToUse = EndPoint.allRecipes
    //NOTE: Defaults to all recipes for most cases, but can be easily switched to bad data for testing.
    func getRecipes() async -> [Recipe] {
        guard let url = endPointToUse.url else {
            print("Invalid URL")
            return []
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                
                let recipes = try decoder.decode(Recipes.self, from: data)
                return recipes.recipes
            } else {
                print("Invalid response from server")
                return [Recipe.malformedRecipes]
            }
        } catch {
            print("Failed to fetch or decode recipes: \(error)")
            return [Recipe.malformedRecipes]
        }
    }

}
