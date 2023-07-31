//
//  EditSettingsView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/21/23.
//

import SwiftUI

struct EditSettingsView: View {
    let currentUser: User
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(currentUser: User) {
        self.currentUser = currentUser
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(currentUser: currentUser))
    }
    
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
                    HStack {
                        Text("First:")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.trailing, 5)
                        Text(currentUser.first)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                    .frame(width: 170, height: 30)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(Color.white), alignment: .bottom)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Last:")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.trailing, 5)
                        Text(currentUser.last)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    .frame(width: 170, height: 30)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(Color.white), alignment: .bottom)
                    .padding(.bottom, 10)
                    
                    Spacer()
                }
                .frame(width: 340, height: 30)
                
                HStack {
                    Text("Username:")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text(currentUser.username)
                        .font(.system(size: 20))
                    Spacer()
                }
                .frame(width: 340, height: 30)
                .overlay(Rectangle().frame(height: 1).foregroundColor(Color.white), alignment: .bottom)
                
                Button {
                    Task { try await viewModel.updateUserData() }
                } label: {
                    Text("Save")
                        .font(.system(size: 26, weight: .semibold))
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 60)
                            .stroke(Color.white, lineWidth: 2))
                        
                }
                .padding(.top, 40)
                
                
                Spacer()
            }
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView(currentUser: currentUser).navigationBarBackButtonHidden(true)) {
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
        if #available(iOS 16.0, *) {
            EditSettingsView(currentUser: User.MOCK_USERS[0])
        } else {
            // Fallback on earlier versions
        }
    }
}
