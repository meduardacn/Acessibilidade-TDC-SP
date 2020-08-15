//
//  RecipeDetails.swift
//  recipeExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 15/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import SwiftUI

struct RecipeDetails: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var screenSize: CGSize = CGSize(width: 0, height: 0)
    
    @ObservedObject var viewModel: RecipeDetailsViewModel
    
    var modalHeight: CGFloat = UIScreen.main.bounds.height * 0.60
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                VStack{
                    Image(self.viewModel.recipe.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: self.screenSize.width, height: self.screenSize.height*0.5)
                        .padding(.top,self.screenSize.height * -0.05)
                    self.modal
                }
                
                Button(action: {
                    print("dismiss")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Image("arrow")
                            .foregroundColor(.black)
                            
                        Text("Voltar")
                            .foregroundColor(.black).bold()
                    }.padding()
                        .padding(.top,self.screenSize.height * 0.03)
                }
                
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
                self.screenSize = geometry.size
            }.navigationBarTitle("Three")
        }.edgesIgnoringSafeArea(.top)
        
        
    }
    
    static let heartGradientStart = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))
    static let heartGradientEnd = Color(#colorLiteral(red: 1, green: 0.1647058824, blue: 0.4078431373, alpha: 1))
    
    var modal: some View{
        VStack{
            List{
                HStack{
                    Text(self.viewModel.recipe.name)
                        .font(.largeTitle)
                        .padding(.top)
                    Spacer()
                    self.favorite
                }
                HStack{
                    Image(systemName: "clock")
                    Text("\(self.viewModel.recipe.timeInMinutes) min      ")
                    Image(systemName: "person")
                    Text("\(self.viewModel.recipe.serves) pessoas")
                }
                Text("INGREDIENTES")
                    .bold()
                Text(self.viewModel.recipe.ingredients)
                Text("MODO DE PREPARO")
                    .bold()
                Text(self.viewModel.recipe.preparationMode)
            }.cornerRadius(40)
                .frame(width: self.screenSize.width, height: modalHeight)
                .padding(.top,self.screenSize.height * -0.15)
            
        }
        
    }
    
    var favorite: some View{
        Button(action: {
            print("oi")
            //            self.viewModel.setFavorite(item: recipe)
        }) {
            if self.viewModel.recipe.isFavorited{
                LinearGradient(gradient: Gradient(colors: [DiscoverView.heartGradientStart, DiscoverView.heartGradientEnd]), startPoint: .top, endPoint: .bottom)
                    .mask(Image(systemName: "suit.heart.fill")
                        .resizable())
                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                    .padding(.top)
                    .padding(.trailing)
            }else{
                Image(systemName: "suit.heart")
                    .resizable()
                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                    .padding(.top)
                    .padding(.trailing)
            }
        }
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    let boolean  = false
    static var previews: some View {
        RecipeDetails(viewModel: RecipeDetailsViewModel(recipe: Recipe.falafel))
    }
}
