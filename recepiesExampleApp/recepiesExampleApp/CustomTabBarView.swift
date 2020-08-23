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
            DiscoverView(viewModel: DiscoverViewModel())
                .tabItem {
                    ZStack{
                        Image(systemName:  "magnifyingglass")
                        Text("Descobrir")
                    }
            }
            Text("Todo second item")
                .tabItem{
                    ZStack{
                        Image(systemName: "heart")
                        Text("Favoritas")
                    }
                    
                    
            }
            ProfileView()
                .tabItem{
                    ZStack{
                        Image(systemName: "person")
                        Text("Perfil")
                    }
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
