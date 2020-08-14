//
//  Recepie.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 14/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation

struct Recepie: Identifiable {
    var id: UUID {
        UUID()
    }
    
    var name: String
    var timeInMinutes: Int
    var serves: Int
    var isFavorited: Bool
    
    var ingredients: String
    var preparationMode: String
    
    var imageName: String
    
    #if DEBUG

    static let pancakes: Recepie =
        Recepie(name: "Panquecas com mel",
                 timeInMinutes: 20,
                 serves: 2,
                 isFavorited: false,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "pancakes")
    
    static let eggs: Recepie =
        Recepie(name: "Ovo mexido com ricota",
                 timeInMinutes: 10,
                 serves: 1,
                 isFavorited: true,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "eggs")
        
    
    #endif
}
