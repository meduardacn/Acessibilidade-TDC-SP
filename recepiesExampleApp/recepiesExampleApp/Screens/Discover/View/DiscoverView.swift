//
//  DiscoverView.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 14/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import SwiftUI

struct DiscoverView: View {
    @State var screenSize: CGSize = CGSize(width: 0, height: 0)
    
    @ObservedObject var viewModel: DiscoverViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                List{
                    self.header
                    self.listOfButtons
                    ScrollView(.vertical, showsIndicators: false) {
                        self.forBreakfast
                        self.popular
                    }.listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
                    
                    Spacer()
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                    self.screenSize = geometry.size
                }
            }.edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    var header: some View {
        ZStack(alignment: .bottomLeading, content: {
            Rectangle()
                .fill(Color(.white))
                .frame(height: self.screenSize.height*0.135)
            Text("Receitas")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom,self.screenSize.width*0.025)
        })
    }
    
    static let gradientStart = Color(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
    static let gradientEnd = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))
    
    var listOfButtons: some View{
        VStack{
            HStack{
                recipeButtons(buttonName: "Receitas fáceis")
                recipeButtons(buttonName: "Para Compartilhar")
            }
            HStack{
                recipeButtons(buttonName: "Sobremesas")
                recipeButtons(buttonName: "Pratos Veganos")
            }
        }
        .padding(.top, screenSize.height*0.02 )
        .listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
        
    }
    
    func recipeButtons(buttonName: String )-> some View {
        Button(action: {
            //
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .shadow(radius: 3)
                Text(buttonName)
                    .bold()
                    .foregroundColor(.white)
            }.frame(width: self.screenSize.width*0.45, height: self.screenSize.height*0.05, alignment: .center)
        }
    }
    
    var forBreakfast: some View {
        VStack(alignment: .leading){
            Text("Para o café da manhã")
                .font(.title)
                .bold()
            HStack{
                ForEach(self.viewModel.breakfast) { recipe in
                    NavigationLink(destination: RecipeDetails(viewModel: RecipeDetailsViewModel(recipe: recipe))
                    .navigationBarTitle("")
                    .navigationBarHidden(true)) {
                        self.recipeCard(recipe)
                    }
                    
                }
            }
        }
        .listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
    }
    
    var popular: some View{
        VStack(alignment: .leading){
            Text("Popular")
                .font(.title)
                .bold()
            ForEach(0..<self.viewModel.popular.count) { i in
                HStack{
                    if(i%2 == 0){
                        self.popoularNavigation(recipe: self.viewModel.popular[i])
                        self.popoularNavigation(recipe: self.viewModel.popular[i+1])
                    }
                }
            }
        }.padding(.top)
            .listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
        
    }
    
    func popoularNavigation(recipe: Recipe) -> some View{
        NavigationLink(destination: RecipeDetails(viewModel: RecipeDetailsViewModel(recipe: recipe))
        .navigationBarTitle("")
        .navigationBarHidden(true)) {
            self.recipeCard(recipe)
        }
    }
    
    
    static let heartGradientStart = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))
    static let heartGradientEnd = Color(#colorLiteral(red: 1, green: 0.1647058824, blue: 0.4078431373, alpha: 1))
    
    func recipeCard(_ recipe: Recipe) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: screenSize.width*0.43, height: screenSize.height*0.35, alignment: .leading)
                .shadow(radius: 5)
            VStack(alignment: .leading){
                Image(recipe.imageName)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: screenSize.width*0.43, height: screenSize.height*0.22, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(recipe.name)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading)
                Spacer()
                HStack{
                    VStack{
                        HStack{
                            Image(systemName: "clock")
                            Text("\(recipe.timeInMinutes) min      ").font(.footnote)
                        }.padding(.leading)
                        HStack{
                            Image(systemName: "person")
                            Text("\(recipe.serves) pessoas").font(.footnote)
                        }.padding(.leading)
                    }
                    Spacer()
                    ZStack{
                        Button(action: {
                            self.viewModel.setFavorite(item: recipe)
                        }) {
                            if recipe.isFavorited{
                                LinearGradient(gradient: Gradient(colors: [DiscoverView.heartGradientStart, DiscoverView.heartGradientEnd]), startPoint: .top, endPoint: .bottom)
                                    .mask(Image(systemName: "suit.heart.fill")
                                        .resizable())
                                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                            }else{
                                Image(systemName: "suit.heart")
                                    .resizable()
                                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                            }
                        }
                        
                    }.padding(.trailing)
                }
                Spacer()
            }
            .frame(width: screenSize.width*0.4, height: screenSize.height*0.35)
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screenSize.width*0.43, height: screenSize.height*0.022, alignment: .leading)
                .padding(.top,screenSize.height*0.07)
        }
        .padding(.trailing)
        .padding(.top)
    }
    
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(viewModel: DiscoverViewModel())
    }
}
