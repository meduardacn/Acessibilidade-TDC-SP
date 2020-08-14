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
    @Published var breakfast: [Recepie]
    @Published var popular: [Recepie]
    @State var favorites: [Recepie] = []
    
    init() {
        breakfast = [Recepie.pancakes,Recepie.eggs]
        popular = []
        initFavorites()
    }
    
    func initFavorites(){
        for recepie in breakfast{
            if recepie.isFavorited{
                favorites.append(recepie)
            }
        }
        for recepie in popular{
            if recepie.isFavorited{
                favorites.append(recepie)
            }
        }
    }
    
    
}
