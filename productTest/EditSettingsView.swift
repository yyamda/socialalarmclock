//
//  EditSettingsView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/21/23.
//

import SwiftUI

struct EditSettingsView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Edit Your Profile")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.top, 10)
                
                HStack {
                    Image("Tyler")
                        .resizable()
                        .frame(width: 125, height: 125)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.leading, 45)
                    VStack {
                        Image("Camera")
                            .resizable()
                            .frame(width: 40, height: 30)
                        
                        Spacer()
                    }
                    .frame(width: nil, height: 150)
                }
                .padding(.bottom, 50)
                
                HStack {
                    Text("Full Name:")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text("Yuta Yamada")
                        .font(.system(size: 20))
                    Spacer()
                }
                .frame(width: 340, height: 30)
                .overlay(Rectangle().frame(height: 1).foregroundColor(Color.white), alignment: .bottom)
                .padding(.bottom, 10)
                
                HStack {
                    Text("Username:")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text("yyamada20" )
                        .font(.system(size: 20))
                    Spacer()
                }
                .frame(width: 340, height: 30)
                .overlay(Rectangle().frame(height: 1).foregroundColor(Color.white), alignment: .bottom)
                Spacer()
            }
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView(user: user).navigationBarBackButtonHidden(true)) {
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

struct EditSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        EditSettingsView(user: User.MOCK_USERS[0])
    }
}
