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
    @Published var popular: [Recipe]
    
    @Published var favorites: [Recipe] = []
    
    init() {
        breakfast = Recipe.breakfast
        popular = Recipe.popular
        favorites = breakfast.filter({ (elem) -> Bool in
            if elem.isFavorited { return true }
            else { return false }
        })
        favorites = popular.filter({ (elem) -> Bool in
            if elem.isFavorited { return true }
            else { return false }
        })
        
    }
        
    func setFavorite(item recipe: Recipe) {
        if let index = self.breakfast.firstIndex(where: { $0.id == recipe.id }) {
            if self.breakfast[index].isFavorited {
                self.breakfast[index].isFavorited = false
                favorites = favorites.filter { (elem) -> Bool in
                    if elem.isFavorited { return true }
                    else { return false }
                }
            }else {
                self.breakfast[index].isFavorited = true
                favorites.append(self.breakfast[index])
            }
            self.objectWillChange.send()
            return
        }
        if let index = self.popular.firstIndex(where: { $0.id == recipe.id }) {
            if self.popular[index].isFavorited {
                self.popular[index].isFavorited = false
                favorites = favorites.filter { (elem) -> Bool in
                    if elem.isFavorited { return true }
                    else { return false }
                }
            }else{
                self.popular[index].isFavorited = true
                favorites.append(self.popular[index])
            }
            self.objectWillChange.send()
            return
        }
    }
    
    
}
