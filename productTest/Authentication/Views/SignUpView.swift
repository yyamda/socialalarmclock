//
//  SignUpView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/16/23.
//

import SwiftUI

struct SignUpView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var email = ""
    @State private var showingLoginScreen = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
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

                
                        VStack {
                            HStack {
                                VStack {
                                    Text("First")
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 130, alignment: .leading)
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                        
                                    
                                    TextField("", text: $viewModel.first)
                                    //                            TextField("", text: $username)
                                        .padding()
                                        .frame(width: 130, height: 40)
                                        .background(Color.white)
                                        .cornerRadius(60)
                                        .padding(.top, 10)
                                        .padding(.bottom, 20)
                                        .autocapitalization(.none)
                                }
                                .padding(.trailing, 20)

                                VStack {
                                    Text("Last")
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 130, alignment: .leading)
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                        .padding(.horizontal, 10)
                                    
                                    TextField("", text: $viewModel.last)
                                    //                            TextField("", text: $username)
                                        .padding()
                                        .frame(width: 130, height: 40)
                                        .background(Color.white)
                                        .cornerRadius(60)
                                        .padding(.top, 10)
                                        .padding(.bottom, 20)
                                        .autocapitalization(.none)
                                }
                                
                            }
                            Text("Username")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 280, alignment: .leading)
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding(.horizontal, 30)
                            
                            
                            TextField("", text: $viewModel.username)
//                            TextField("", text: $username)
                                .padding()
                                .frame(width: 280, height: 40)
                                .background(Color.white)
                                .cornerRadius(60)
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                                .autocapitalization(.none)
                                
                            
                            Text("Email")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 280, alignment: .leading)
                                .foregroundColor(.white)
//                                .padding(.top, 40)
                                .padding(.horizontal, 30)
                            
                            TextField("", text: $viewModel.email)
//                            TextField("", text: $email)
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
//                            SecureField("", text: $password)
                                .padding()
                                .frame(width: 280, height: 40)
                                .background(Color.white)
                                .cornerRadius(60)
                                .padding(.bottom, 60)
                                .autocapitalization(.none)
                            

                            Button {
                                Task{ try await viewModel.createUser() }
                                
                            } label: {
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
                        .overlay(RoundedRectangle(cornerRadius: 60)
                            .stroke(Color.white, lineWidth: 5)
                        )

                    Image("orIcon")
                        .resizable()
                        .frame(width: 380, height: 70)
                        .padding(.top)
                    
                    
                    HStack {
                        Text("Already a user?")
                            .foregroundColor(.white)
                            .bold()
                        
                    
                        NavigationLink(destination: LoginView()) {
                            Text("LOG IN")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .underline()
                        }
                    }
                    .padding(.bottom, 1)
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .top)
//                .border(Color.yellow, width: 2)
                
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
