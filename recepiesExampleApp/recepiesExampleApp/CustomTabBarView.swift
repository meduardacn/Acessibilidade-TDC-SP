//
//  CustomTabBarView.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 12/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        TabView {
            DiscoverView(viewModel: RecipeDataViewModel())
                .tabItem {
                    Image(systemName:  "magnifyingglass")
                    Text("Descobrir")
            }
            Text("Todo second item")
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritas")
                    
            }
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    
                    Text("Perfil")
            }
        }
        .accentColor(.black)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
