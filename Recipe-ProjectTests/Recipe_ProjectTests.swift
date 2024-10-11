//
//  Recipe_ProjectTests.swift
//  Recipe-ProjectTests
//
//  Created by Tyler Radke on 10/11/24.
//

import XCTest
@testable import Recipe_Project

final class AllRecipesTests: XCTestCase {
    
    var allRecipes: AllRecipes!
    
    override func setUp() {
        super.setUp()
        allRecipes = AllRecipes.shared
    }
    
    override func tearDown() {
        allRecipes = nil
        super.tearDown()
    }

    // Test for fetching valid recipes
    func testFetchValidRecipes() async {
        allRecipes.endPointToUse = .allRecipes
        let recipes = await allRecipes.getRecipes()
        
        XCTAssertFalse(recipes.isEmpty, "Expected recipes, but got an empty array")
        XCTAssertEqual(recipes[0].name, "Apam Balik", "Expected 'Recipe 1' as the first recipe") // Adjust to match your expected response
    }
    
    // Test for fetching malformed data
    func testFetchMalformedData() async {
        allRecipes.endPointToUse = .malformedData
        let recipes = await allRecipes.getRecipes()
        
        XCTAssertEqual(recipes.first?.name, Recipe.malformedRecipes.name, "Expected malformedRecipes to be returned for malformed data")
    }
    
    // Test for fetching empty data
    func testFetchEmptyData() async {
        allRecipes.endPointToUse = .emptyData
        let recipes = await allRecipes.getRecipes()
        
        XCTAssertTrue(recipes.isEmpty, "Expected an empty array for empty data, but got non-empty recipes")
    }
}

