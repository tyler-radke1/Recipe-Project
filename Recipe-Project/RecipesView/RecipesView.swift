//
//  RecipeView.swift
//  Recipe-Project
//
//  Created by Tyler Radke on 10/10/24.
//

import SwiftUI
import Kingfisher

struct RecipesView: View {
    @ObservedObject var vm: ViewModel
    
    init() {
        self.vm = ViewModel()
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    pickerView()
                    
                    searchBar()
                }
                
                if vm.sortedRecipes.isEmpty {
                    HStack {
                        Spacer()
                        Text("Couldn't find any recipes. Try again later!")
                        Spacer()
                    }
                }
                List(vm.sortedRecipes, id: \.self) { recipe in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(recipe.name)
                            .font(.headline)
                        
                        Text(recipe.cuisine)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        if let url = recipe.photoUrlLarge {
                            KFImage(url)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(height: 200)
                        } else {
                            HStack {
                                Spacer()
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .frame(height: 200)
                                Spacer()
                            }
                        }
                        
                        
                        if let sourceURL = recipe.sourceURL {
                            Link("View Recipe", destination: sourceURL)
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        
                        if let youtubeURL = recipe.youtubeURL {
                            Link("Watch on YouTube", destination: youtubeURL)
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .refreshable {
                await vm.getRecipes()
            }
            .task {
                await vm.getRecipes()
            }
        }
    }
    
    @ViewBuilder
    func pickerView() -> some View {
        HStack {
            Picker("Sort by", selection: $vm.sortOption) {
                ForEach(RecipesView.ViewModel.SortOption.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            }
        }
    }
    
    @ViewBuilder
    func searchBar() -> some View {
            HStack {
                Image(systemName: "magnifyingglass")
                       .foregroundColor(.gray)
                       .font(.system(size: 16))

                   HStack {
                       TextField("Search", text: $vm.searchString)
                           .font(Font.system(size: 21))
                           .background(Color.clear)
                           .padding(.leading, 10)
                       
                       Image(systemName: "xmark")
                           .font(.system(size: 16))
                           .onTapGesture {
                               vm.searchString = ""
                           }
                           .padding(.trailing, 10)
                   }
                   .background(Color.gray.opacity(0.2))
                   .clipShape(Capsule())
            }
            .padding(.trailing, 16)
        }
}


#Preview {
    RecipesView()
}
