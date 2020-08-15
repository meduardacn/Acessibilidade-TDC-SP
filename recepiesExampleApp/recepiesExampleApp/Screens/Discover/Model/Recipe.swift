//
//  Recipe.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 14/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation

class Recipe: Identifiable {
    var id: UUID
    
    var name: String
    var timeInMinutes: Int
    var serves: Int
    var isFavorited: Bool
    
    var ingredients: String
    var preparationMode: String
    
    var imageName: String
    
    init(name: String,
    timeInMinutes: Int,
    serves: Int,
    isFavorited: Bool,
    ingredients: String,
    preparationMode: String,
    imageName: String) {
        self.id = UUID()
        self.name = name
        self.timeInMinutes = timeInMinutes
        self.serves = serves
        self.isFavorited = isFavorited
        self.ingredients = ingredients
        self.preparationMode = preparationMode
        self.imageName = imageName
    }
    #if DEBUG

    static let pancakes: Recipe =
        Recipe(name: "Panquecas com mel",
                 timeInMinutes: 20,
                 serves: 2,
                 isFavorited: false,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "pancakes")
    
    static let eggs: Recipe =
        Recipe(name: "Ovo mexido com ricota",
                 timeInMinutes: 10,
                 serves: 1,
                 isFavorited: true,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "eggs")
    
    static let falafel: Recipe =
    Recipe(name: "Falafel",
             timeInMinutes: 45,
             serves: 6,
             isFavorited: false,
             ingredients: "",
             preparationMode: "",
             imageName: "falafel")
    
    static let salad: Recipe =
    Recipe(name: "Salada Cesar",
             timeInMinutes: 25,
             serves: 4,
             isFavorited: true,
             ingredients: "",
             preparationMode: "",
             imageName: "salad")
    
    static let quiche: Recipe =
    Recipe(name: "Quiche de alho póro com ricota",
             timeInMinutes: 60,
             serves: 8,
             isFavorited: false,
             ingredients: "",
             preparationMode: "",
             imageName: "quiche")
    
    static let lasagna: Recipe =
    Recipe(name: "Lasanha bolonhesa",
             timeInMinutes: 40,
             serves: 5,
             isFavorited: false,
             ingredients: "",
             preparationMode: "",
             imageName: "lasagna")
    
    
    
    #endif
}
