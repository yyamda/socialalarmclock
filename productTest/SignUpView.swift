//
//  SignUpView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/16/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
            
                VStack {
                    Text("Sign Up")
                        .font(.system(size: 35, weight: .bold))
                        .frame(maxWidth: 360, alignment: .leading)
//                        .border(Color.blue, width: 2)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .padding(.leading, 15)
                        .padding(.bottom, 5)
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width: 340, height: 400)
                            .overlay(RoundedRectangle(cornerRadius: 60)
                                .stroke(Color.white, lineWidth: 5)
                            )
                    
                        VStack {
                            Text("Email")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 280, alignment: .leading)
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding(.horizontal, 30)
                            
                            TextField("", text: $username)
                                .padding()
                                .frame(width: 280, height: 40)
                                .background(Color.white)
                                .cornerRadius(60)
                                .padding(.bottom, 20)
                                .autocapitalization(.none)
                                

                                
                            Text("Password")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 280, alignment: .leading)
                                .foregroundColor(.white)
                                
                            SecureField("", text: $password)
                                .padding()
                                .frame(width: 280, height: 40)
                                .background(Color.white)
                                .cornerRadius(60)
                                .padding(.bottom, 60)
                                .autocapitalization(.none)
                            

                            NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
                                Text("Sign Up")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .frame(width: 280, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(60)
                                    .padding(.bottom, 45)
                            }

                        }
                        
                        
                    }
                    Image("orIcon")
                        .resizable()
                        .frame(width: 380, height: 70)
                        .padding(.top)
                    
                    
                    HStack {
                        Text("Already a user?")
                            .foregroundColor(.white)
                            .bold()
                        
                    
                        NavigationLink(destination: ContentView()) {
                            Text("LOG IN")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .underline()
                        }
                    }
                    .padding(.bottom, 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .top)
//                .border(Color.yellow, width: 2)
                .offset(y: -100)
                
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
