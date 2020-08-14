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
        GeometryReader { geometry in
            VStack{
                self.header
                List{
                    self.listOfButtons
                    self.forBreakfast
                    Spacer()
                }
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
                self.screenSize = geometry.size
            }
        }.edgesIgnoringSafeArea(.top)
    }
    
    var header: some View {
        ZStack(alignment: .bottomLeading, content: {
            Rectangle()
                .fill(Color(.white))
                .frame(height: self.screenSize.height*0.15)
            Text("Receitas")
                .font(.largeTitle)
                .fontWeight(.semibold)
                
                .padding(.leading,self.screenSize.width*0.05)
                .padding(.bottom,self.screenSize.width*0.025)
        })
    }
    
    static let gradientStart = Color(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
    static let gradientEnd = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))
    
    var listOfButtons: some View{
        VStack{
            HStack{
                 recepieButtons(buttonName: "Receitas fáceis")
                 recepieButtons(buttonName: "Para Compartilhar")
            }
            HStack{
                 recepieButtons(buttonName: "Sobremesas")
                 recepieButtons(buttonName: "Pratos Veganos")
            }
        }
        .padding(.top, screenSize.height*0.02 )
        .listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
       
    }
    
    func recepieButtons(buttonName: String )-> some View {
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
            HStack{
                ForEach(self.viewModel.breakfast) { recepie in
                    Button(action: {
                        //
                    }) {
                        self.recepieCard(recepie)
                    }
                    
                }
            }
        }.padding(.top,screenSize.height*0.05)
        .listRowBackground(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
    }
  
    static let heartGradientStart = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))
    static let heartGradientEnd = Color(#colorLiteral(red: 1, green: 0.1647058824, blue: 0.4078431373, alpha: 1))
    
    func recepieCard(_ recepie: Recepie) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: screenSize.width*0.43, height: screenSize.height*0.35, alignment: .leading)
                .shadow(radius: 5)
            VStack(alignment: .leading){
                Image(recepie.imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: screenSize.width*0.43, height: screenSize.height*0.22, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(recepie.name)
                    .padding(.leading)
                    .padding(.trailing,screenSize.width*0.1)
                HStack{
                    VStack{
                        HStack{
                            Image(systemName: "clock")
                            Text("\(recepie.timeInMinutes) min      ").font(.footnote)
                        }.padding(.leading)
                        HStack{
                            Image(systemName: "person")
                            Text("\(recepie.serves) pessoas").font(.footnote)
                        }.padding(.leading)
                    }
                    Spacer()
                    ZStack{
                        Button(action: {
//                            recepie.isFavorited.toggle()
                        }) {
                            if recepie.isFavorited{
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
            
            Rectangle()
            .fill(Color(.white))
            .frame(width: screenSize.width*0.43, height: screenSize.height*0.015)
                .padding(.top,screenSize.height*0.075)
        }.padding(.trailing)
    }
    
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(viewModel: DiscoverViewModel())
    }
}
