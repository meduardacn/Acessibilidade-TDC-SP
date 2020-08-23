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
    
    @ObservedObject var cellViewModel: RecipeDetailsViewModel
    @ObservedObject var viewModel: DiscoverViewModel
    
    var modalHeight: CGFloat = UIScreen.main.bounds.height * 0.60
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                VStack{
                    ZStack{
                        Image(self.cellViewModel.recipe.imageName, label: Text(self.cellViewModel.recipe.imageDescription))
                            .resizable()
                            .renderingMode(.original)
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3975508052)))
                    }.frame(width: self.screenSize.width, height: self.screenSize.height*0.5)
                    .padding(.top,self.screenSize.height * -0.05)
                    
                    self.modal
                }
                
                Button(action: {
                    print("dismiss")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Image("arrow")
                            .foregroundColor(.white)
                            .accessibility(hidden: true)
                            
                        Text("Voltar")
                            .foregroundColor(.white)
                            .bold()
                        
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
                    Text(self.cellViewModel.recipe.name)
                        .font(.largeTitle)
                        .padding(.top)
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.setFavorite(item: self.cellViewModel.recipe)
                    }) {
                        ZStack{
                            if self.cellViewModel.recipe.isFavorited{
                                LinearGradient(gradient: Gradient(colors: [DiscoverView.heartGradientStart, DiscoverView.heartGradientEnd]), startPoint: .top, endPoint: .bottom)
                                    .mask(Image(systemName: "suit.heart.fill")
                                        .resizable())
                                        .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                                        .frame(minWidth: 44, minHeight: 44)
                                        .padding(.top)
                                        .padding(.trailing)
                            }else{
                                Image(systemName: "suit.heart")
                                    .resizable()
                                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                                    .frame(minWidth: 44, minHeight: 44)
                                    .padding(.top)
                                    .padding(.trailing)
                            }
                        }
                    }
                    .accessibility(label: Text(self.cellViewModel.recipe.isFavorited ? "Desfavoritar receita" : "Favoritar Receita"))
                }
                HStack{
                    Image(systemName: "clock")
                        .accessibility(hidden: true)
                    Text("\(self.cellViewModel.recipe.timeInMinutes) min     ")
                    Image(systemName: "person")
                        .accessibility(hidden: true)
                    Text("\(self.cellViewModel.recipe.serves) pessoas")
                }
                Text("INGREDIENTES")
                    .bold()
                Text(self.cellViewModel.recipe.ingredients)
                Text("MODO DE PREPARO")
                    .bold()
                Text(self.cellViewModel.recipe.preparationMode)
            }.cornerRadius(40)
                .frame(width: self.screenSize.width, height: modalHeight)
                .padding(.top,self.screenSize.height * -0.15)
            
        }
        
    }
    
}

struct RecipeDetails_Previews: PreviewProvider {
    let boolean  = false
    static var previews: some View {
        RecipeDetails(cellViewModel: RecipeDetailsViewModel(recipe: Recipe.falafel), viewModel: DiscoverViewModel())
    }
}
