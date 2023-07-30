//
//  SettingsView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/21/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = ContentViewModel()
    let user: User 
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Settings")
                        .font(.system(size: 35, weight: .bold))
                        .frame(maxWidth: 360, alignment: .leading)
//                        .border(Color.blue, width: 2)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                        .padding(.bottom, 20)
                        .padding(.leading, 10)
                    Spacer()
                }
                HStack {
                    Text("Your Profile")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                        .padding(.leading, 10)
                    Spacer()
                }
                NavigationLink(destination: EditSettingsView(user: user).navigationBarBackButtonHidden(true)) {
                    HStack {
                        Image("Tyler")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.leading, 20)
                            .padding(.trailing, 15)
                        
                        Text("Yuta Yamada")
                        
                        Spacer()
                        Image("BackButton")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(180))
                            .padding(.trailing, 15)
                        
                    }
                }
                .frame(width: nil, height: 120)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(red: 0.02, green: 0.62, blue: 0.66), lineWidth: 2)
                )
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                .padding(.bottom, 30) 
                
                HStack {
                    Text("Privacy Settings")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                        .padding(.leading, 10)
                    Spacer()
                }
                
                Button(action: {
                    AuthService.shared.signout()
                }) {
                    Text("Log Out")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 3))
                    }
                
                Spacer()
                
            }
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomePageView(user: user).navigationBarBackButtonHidden(true)) {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                }
                
            }
        }
        .environment(\.colorScheme, .dark)
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(user: User.MOCK_USERS[0])
    }
}
