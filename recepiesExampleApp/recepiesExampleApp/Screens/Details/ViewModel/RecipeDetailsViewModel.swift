//
//  RecipeDetailsViewModel.swift
//  recipeExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 15/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation

class RecipeDetailsViewModel: ObservableObject {
    @Published var recipe: Recipe
    

    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
}
