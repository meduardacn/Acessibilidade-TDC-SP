//
//  DiscoverViewModel.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 14/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation
import SwiftUI

class DiscoverViewModel: ObservableObject{
    @Published var breakfast: [Recipe]
    @State var popular: [Recipe]
    
    init() {
        breakfast = Recipe.breakfast
        popular = Recipe.popular
    }
        
    func setFavorite(item recipe: Recipe) {
        if let index = self.breakfast.firstIndex(where: { $0.id == recipe.id }) {
            self.breakfast[index].isFavorited = !self.breakfast[index].isFavorited
            self.objectWillChange.send()
            return
        }
        if let index = self.popular.firstIndex(where: { $0.id == recipe.id }) {
            self.popular[index].isFavorited = !self.popular[index].isFavorited
            self.objectWillChange.send()
            return
        }
    }
    
    
}
