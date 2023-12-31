//
//  LoginView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/28/23.
//

import SwiftUI

struct LoginView: View {
//    @State private var username = ""
//    @State private var password = ""
    @State private var showingLoginScreen = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
            
                VStack {
                    Text("Log In")
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
                            
                            TextField("", text: $viewModel.email)
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
                                
                            SecureField("", text: $viewModel.password)
                                .padding()
                                .frame(width: 280, height: 40)
                                .background(Color.white)
                                .cornerRadius(60)
                                .padding(.bottom, 60)
                                .autocapitalization(.none)
                            
                            Button {
                                Task {try await viewModel.signIn() }
                            } label: {
                                Text("Log In")
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
                        Text("New to this app?")
                            .foregroundColor(.white)
                            .bold()
                        
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("SIGN UP")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .underline()
                        }
                
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text("Forgot your password")
                            .foregroundColor(.white)
                            .bold()
                        
                        
//                        NavigationLink(destination: DetailView()) {
                        Text("RESET PASSWORD")
                            .foregroundColor(.white)
                            .underline()
                
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .top)
//                .border(Color.yellow, width: 2)
                
            
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
