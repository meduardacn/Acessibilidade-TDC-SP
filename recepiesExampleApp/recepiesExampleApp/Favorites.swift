//
//  Favorites.swift
//  recipeExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 15/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation

class Favorites: ObservableObject {
    static let sharedFavorites = Favorites()
    private var recipes: Set<UUID>

    init() {
        recipes = []
        for elem in Recipe.breakfast{
            if elem.isFavorited{
                recipes.insert(elem.id)
            }
        }
        for elem in Recipe.popular{
            if elem.isFavorited{
                recipes.insert(elem.id)
            }
        }
    }

    func contains(_ recipe: Recipe) -> Bool {
        recipes.contains(recipe.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func setFavorite(_ recipe: Recipe) {
        if let index = Recipe.breakfast.firstIndex(where: { $0.id == recipe.id }) {
            if Recipe.breakfast[index].isFavorited{
                recipes.insert(recipe.id)
            }else{
                recipes.remove(recipe.id)
            }
            Recipe.breakfast[index].isFavorited = !Recipe.breakfast[index].isFavorited
            self.objectWillChange.send()
            return
        }
        if let index = Recipe.popular.firstIndex(where: { $0.id == recipe.id }) {
            let recipe = Recipe.popular[index]
            if recipe.isFavorited{
                recipes.insert(recipe.id)
            }else{
                recipes.remove(recipe.id)
            }
            recipe.isFavorited = !recipe.isFavorited
            self.objectWillChange.send()
            return
        }
        self.objectWillChange.send()
    }

}
