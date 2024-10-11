//
//  RecipeObject.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/10/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    var cuisine: String
    var name: String
    var photoUrlLarge: URL?
    var photoUrlSmall: URL?
    var sourceURL: URL?
    var id: String
    var youtubeURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case cuisine = "cuisine"
        case name = "name"
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceURL = "source_url"
        case id = "uuid"
        case youtubeURL = "youtube_url"
    }
    
    static let malformedRecipes = Recipe(cuisine: "There was an issue getting the recipes. Please try again later.", name: "Error!", photoUrlLarge: nil, photoUrlSmall: nil, id: "")
}

struct Recipes: Codable {
    var recipes: [Recipe]
}
