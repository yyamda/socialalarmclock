//
//  UserAccountView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/17/23.
//

import SwiftUI

struct UserAccountView: View {
    @State private var myFriendsTab = true
    let user: User
    
    var body: some View {
        NavigationView {
            VStack {
                // My Profile Tab
                VStack {
                    Image("Tyler")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top, 30)
                    
                    // Full Name + User Info
                    VStack {
                        Text(user.first)
                            .font(.system(size: 32, weight: .bold))
                        Text(user.username)
                            .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                            .font(.system(size: 20, weight: .bold))
                    }
                    .frame(width: 290, height: 80)
//                    .border(Color.white, width: 2)
                    
                    // Rough User Stats
                    HStack {
                        VStack {
                            Text("20")
                                .font(.system(size: 30, weight: .bold))
                            Text("Friends")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                        .frame(width: 130, height: 100)
                        
//                        .border(Color.white, width: 2)
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("320")
                                .font(.system(size: 30, weight: .bold))
                                .padding(.trailing, 20)
                            Text("Times Woken Friends")
                                .font(.system(size: 20, weight: .bold))
                                .multilineTextAlignment(.center)
                                .padding(.trailing, 20)
                            
//                                .border(Color.white, width: 2)

                            Spacer()
                        }
                        .frame(width: 150, height: 100)
                        
//                        .border(Color.white, width: 2)
                    }
                }
                .frame(width: 320, height: 355)
//                .border(Color.white, width: 2)
                .overlay(RoundedRectangle(cornerRadius: 60)
                    .stroke(Color(red: 0.02, green: 0.62, blue: 0.66), lineWidth: 3)
                )
                
                // My Friends + My Ringtones Tab
                VStack {
                    // Tab
                    HStack {
                        Button(action: {
                            myFriendsTab = true
                        }){
                            Text("My Friends")
                                .font(.system(size: 26, weight: .bold))
                                .padding(.leading, 20)
                                .foregroundColor(myFriendsTab ? .white : Color(red: 0.64, green: 0.64, blue: 0.64))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            myFriendsTab = false
                        }){
                            Text("My Ringtones")
                                .font(.system(size: 26, weight: .bold))
                                .padding(.trailing, 20)
                                .foregroundColor(myFriendsTab ? Color(red: 0.64, green: 0.64, blue: 0.64) : .white)
                        }
                    }
                    .frame(width: 390, height: 20)
                    .padding(.top, 10)
                    
                    // Rectangles
                    HStack {
                        Rectangle()
                            .frame(width: 200, height: 3)
                            .foregroundColor(myFriendsTab ? .white : Color(red: 0.64, green: 0.64, blue: 0.64))
                        Rectangle()
                            .frame(width: 200, height: 3)
                            .foregroundColor(myFriendsTab ? Color(red: 0.64, green: 0.64, blue: 0.64): .white)
                        
                       
                    }
                    .padding(.top, 2)
                    
                    // ScrollView
                    
                    if myFriendsTab {
                        ScrollView {
                            ForEach(0 ... 10, id:\.self) { user in
                                HStack {
                                    Image("Lucas")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .padding(.leading, 10)
                                    VStack (alignment: .leading) {
                                        Text("Lucas Omori")
                                            .font(.system(size: 28, weight: .bold))
                                            .padding(.leading, 10)
                                        Text("username")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                            .padding(.leading, 10)
                                    }
                                    
                                    Spacer()
                                }
                                .frame(width: 390, height: 60)
                                .padding(.vertical, 2)
//                                .border(.white, width: 2)
                                
                            }
                        }
                    }
                    if (!myFriendsTab) {
                        ScrollView {
                            ForEach(0 ... 10, id:\.self) { user in
                                HStack {
                                    Image("PlayButton")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    VStack (alignment: .leading){
                                        Text("Benny Liang")
                                            .font(.system(size: 28, weight: .bold))
                                            .padding(.leading, 10)
                                        Text("I wrote a song for you :)")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                            .padding(.leading, 10)
                                    }
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 25, height: 4)
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 3)
                            }
                        
                        }
                    }
                    
                    Spacer()
                    
                    
                }
                .frame(width: 390, height: 340)
                .padding(.top, 10)
//                .border(Color.white, width: 3)
            }
            .padding(.top, 40)
//            .border(Color.white, width: 3)
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
//                        Image("BackButton")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                    }
//                    
//                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(user: user).navigationBarBackButtonHidden(true)) {
                        Image("CogButton")
                            .resizable()
                            .frame(width: 45, height: 45)
                        }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView(user: User.MOCK_USERS[0])

    }
}
