//
//  ProfileView.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 12/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var screenSize: CGSize = CGSize(width: 0, height: 0)
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                self.header
                self.informations
                self.header
            }.onAppear {
                self.screenSize = geometry.size
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }.edgesIgnoringSafeArea(.top)
        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)))
        
    }
    
    var header: some View {
        ZStack(alignment: .bottomLeading, content: {
            Rectangle()
                .fill(Color(.white))
                .frame(height: self.screenSize.height*0.15)
            Text("Meu perfil")
                .font(.largeTitle)
                .fontWeight(.semibold)
                
                .padding(.leading,self.screenSize.width*0.05)
                .padding(.bottom,self.screenSize.width*0.025)
        })
    }
    
    var informations: some View {
        VStack(alignment: .center){
            Image("happyFace")
            Text(
                """
                Olá! Faça login para ter acesso ao seu
                perfil e as suas receitas favoritas!
                """)
                
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .font(.system(size: 20))
                .frame(width: self.screenSize.width*0.9)
        }.padding(.top,self.screenSize.height*0.05)
    }
    var textFiels: some View{
        Text("")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
