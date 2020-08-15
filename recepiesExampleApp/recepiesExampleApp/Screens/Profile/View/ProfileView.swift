//
//  ProfileView.swift
//  recipesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 12/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var screenSize: CGSize = CGSize(width: 0, height: 0)
    
    // textFields variables
    @State var email: String = ""
    @State var password: String = ""
    @State var onCommitEmail: () -> Void = {}
    @State var onCommitPassword: () -> Void = {}
    @State var securePasswordActive = false
    @State var wrongAnswer = false
    @State var remember = false

   
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                self.header
                self.informations
                self.login
                Spacer()
            }.onAppear {
                self.screenSize = geometry.size
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }.edgesIgnoringSafeArea(.top)
        .background(Color(#colorLiteral(red: 0.9491460919, green: 0.9487624764, blue: 0.9704342484, alpha: 1)))
        
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
            Text("Olá! Faça login para ter acesso ao seu perfil e as suas receitas favoritas!")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .frame(width: self.screenSize.width*0.9,height: self.screenSize.height*0.06)
//            Divider()
        }.padding(.top,self.screenSize.height*0.05)
    }
    
    var login: some View {
        VStack(alignment: .leading){
            Text("E-mail")
                .bold()
                .padding(.top,self.screenSize.height*0.04)
            self.emailTextField
            Text("Senha")
                .bold()
            .padding(.top,self.screenSize.height*0.01)
            self.passwordTextField
            if wrongAnswer{
                self.passwordSupportHStack
            }else{
                self.rememberMe
            }
            self.loginButton
            self.createAccountButton
          
        }
        .frame(width: self.screenSize.width*0.9)

    }
    
    var emailTextField: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(Color(.white))
                .cornerRadius(10)
                .frame(height: self.screenSize.height*0.052)
                .shadow(radius: 5)
            TextField("", text: $email, onCommit: onCommitEmail)
                .padding(.leading)
        }
    }
    
    var passwordTextField: some View {
        ZStack(alignment: .leading){
            if wrongAnswer{
                Rectangle()
                    .fill(Color(.white))
                    .frame(height: self.screenSize.height*0.052)
                    .shadow(radius: 5)
                    .cornerRadius(10)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 2)
                    .frame(height: self.screenSize.height*0.052)
                
            }else{
                Rectangle()
                .fill(Color(.white))
                .cornerRadius(10)
                .frame(height: self.screenSize.height*0.052)
                .shadow(radius: 5)
            }
            
            
            if securePasswordActive {
                SecureField("", text: $password, onCommit: onCommitPassword)
                    .padding(.leading)
            } else {
                TextField("", text: $password, onCommit: onCommitPassword)
                    .padding(.leading)
            }
            Image(systemName: wrongAnswer ?  "xmark.circle.fill" : "")
                .foregroundColor(.red)
                .padding()
            HStack {
                Spacer()
                Button(action: {
                    self.securePasswordActive.toggle()
                }) {
                    Image(systemName: securePasswordActive ? "eye.slash" : "eye")
                        .renderingMode(.original)
                        .padding()
                }
            }
        }
    }
    
    var passwordSupportHStack: some View {
        HStack {
            Text("Senha incorreta.")
            Spacer()
            Button(action: {
                
            }) {
                Text("Esqueceu sua senha?")
                    .underline()
                    .foregroundColor(.blue)
            }
        }.padding(.top,self.screenSize.height*0.01)
    }
    
    var rememberMe: some View{
        HStack {
            Text("Lembre-me")
            Spacer()
            Toggle("", isOn: $remember)
        }.padding(.top,self.screenSize.height*0.01)
    }
    
    static let gradientStart = Color(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
    static let gradientEnd = Color(#colorLiteral(red: 1, green: 0.368627451, blue: 0.2274509804, alpha: 1))

    var loginButton: some View {
        Button(action: {

        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .shadow(radius: 5)
                    .frame(height: self.screenSize.height*0.06)
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(
                 gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                 startPoint: .top,
                 endPoint: .bottom
                    ))
                    .frame(height: self.screenSize.height*0.06)

            Text("Entrar")
                .foregroundColor(.white)
                .bold()
            }
            .frame(height: 0.0446*screenSize.height)
            .padding(.top, screenSize.height*0.04)
        }
    }
    
    var createAccountButton: some View {
        ZStack(alignment: .center){
            Button(action: {

            }) {
                Text("Criar minha conta")
                .underline()
                    .foregroundColor(.blue)
            }
        }.frame(width: self.screenSize.width*0.9)
            .padding(.top, 0.03*screenSize.height)
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
