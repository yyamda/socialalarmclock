//
//  SeparateUserView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/23/23.
//

import SwiftUI

struct SeparateUserView: View {
    @State private var myFriendsTab = true
    @State private var isFriend = true
    @State private var callsReceivedOpen = false
    @State private var callsSentOpen = false
    
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
                        Text("Tyler McNierney")
                            .font(.system(size: 32, weight: .bold))
                        Text("tydagod2")
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
                    .stroke(Color(red: 0.02, green: 0.62, blue: 0.66), lineWidth: 2)
                )
                
                
                if isFriend {
                    VStack {
                        
                        // Friend Stat Text
                        VStack {
                            HStack {
                                Text("yyamada20")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("woke you:")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("0")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("times")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                            }
                            
                            HStack {
                                Text("You woke")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("ytydagod2:")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("0")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                Text("times")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                            }
                           
                        }
                        .padding(.top, 10)
                        
                        HStack {
                            Button(action: {
                                // action here
                            }) {
                                Text("Send a Wake Up Call ")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 80)
                                    .background(Color.clear)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(red: 0.02, green: 0.62, blue: 0.66), lineWidth: 3))
                            }
                            Spacer()
                            Button(action: {
                                // action here
                            }) {
                                Text("Request a Wake Up Call!")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 80)
                                    .background(Color.clear)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(red: 0.02, green: 0.62, blue: 0.66), lineWidth: 3))
                            }
                            
                        }
                        .frame(width: 320, height: nil)
                        .padding(.top, 20)
                        
                        VStack {
                            Button(action: {
                                callsReceivedOpen.toggle()
                            }) {
                                HStack {
                                    Text("Wake Up Calls received from tydagod2")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color.white)
                                        .frame(width: 340, height: 30)
                                    
                                    Spacer()
                                    
                                    if (callsReceivedOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 35, height: 27)
                                    }
                                    if (!callsReceivedOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 35, height: 27)
                                            .rotationEffect(.degrees(180))
                                    }
                                }
                            }
                            .padding(.top, 10)
                            
                            if callsReceivedOpen {
                                ScrollView {
                                    LazyVStack(spacing: 0) {
                                        ForEach(0 ... 10, id:\.self) {
                                            user in
                                            HStack {
                                                    Image("Lucas")
                                                        .renderingMode(.original)
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                        .padding(.trailing, 10)
                                                        
                                                    HStack {
                                                        VStack(alignment: .leading) {
                                                            Text("Rachel Ong")
                                                                .font(.system(size: 18, weight: .semibold))
                                                                .foregroundColor(.white)
                                                                .padding(.bottom, 1)
                                                            
                                                            Text("3 MUTUAL FRIENDS")
                                                                .font(.system(size: 10))
                                                                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                                        }
                                                        Spacer()
                                                    }
                                                    .frame(width: 200, height: 40)
//                                                    .border(.white, width: 2)
                                                    
                                                    Spacer()
                                                    Button(action: {
                                                        // action here
                                                    }) {
                                                        Text("+ add")
                                                            .font(.system(size: 15, weight: .bold))
                                                            .foregroundColor(Color.gray)
                                                            .frame(width: 45, height: 40)
                                                            .background(Color.clear)
                                                            .cornerRadius(40)
                                                        
//                                                            .border(.white, width: 2)
                                                    }
                                                }
                                                .frame(width: 380, height: 60)
                                                .background(.black)
                                            
//                                                .border(.white, width: 2)
                                                
                                        }
                                    }
                                }
                                .frame(maxHeight: 250)
                                .padding(.bottom, 10)
                            }
                            
                            if (!callsReceivedOpen) {
                                Rectangle()
                                    .frame(width: 380, height: 3)
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                            }
                            
                            
                        }
                        
                        VStack {
                            Button(action: {
                                callsSentOpen.toggle()
                            }) {
                                HStack {
                                    Text("Wake Up Calls received from tydagod2")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color.white)
                                        .frame(width: 340, height: 30)
                                    
                                    Spacer()
                                    
                                    if (callsSentOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 35, height: 27)
                                    }
                                    if (!callsSentOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 35, height: 27)
                                            .rotationEffect(.degrees(180))
                                    }
                                }
                            }
                            .padding(.top, 10)
                            
                            if callsSentOpen {
                                ScrollView {
                                    LazyVStack(spacing: 0) {
                                        ForEach(0 ... 10, id:\.self) {
                                            user in
                                            HStack {
                                                    Image("Lucas")
                                                        .renderingMode(.original)
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                        .padding(.trailing, 10)
                                                        
                                                    HStack {
                                                        VStack(alignment: .leading) {
                                                            Text("Rachel Ong")
                                                                .font(.system(size: 18, weight: .semibold))
                                                                .foregroundColor(.white)
                                                                .padding(.bottom, 1)
                                                            
                                                            Text("3 MUTUAL FRIENDS")
                                                                .font(.system(size: 10))
                                                                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                                        }
                                                        Spacer()
                                                    }
                                                    .frame(width: 200, height: 40)
//                                                    .border(.white, width: 2)
                                                    
                                                    Spacer()
                                                    Button(action: {
                                                        // action here
                                                    }) {
                                                        Text("+ add")
                                                            .font(.system(size: 15, weight: .bold))
                                                            .foregroundColor(Color.gray)
                                                            .frame(width: 45, height: 40)
                                                            .background(Color.clear)
                                                            .cornerRadius(40)
                                                        
//                                                            .border(.white, width: 2)
                                                    }
                                                }
                                                .frame(width: 380, height: 60)
                                                .background(.black)
                                            
//                                                .border(.white, width: 2)
                                        }
                                    }
                                }
                                .padding(.bottom, 10)
                            }
                            
                            if (!callsSentOpen) {
                                Rectangle()
                                    .frame(width: 380, height: 3)
                                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                            }
                            
                            
                        }
                        

                    }
                }
                
                if (!isFriend) {
                    Button(action: {
                        // Wake up call Action
                    }) {
                        Text("+ Send a Friend Request ")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: 300, height: 70)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(40)
                            .padding(.top, 20)
                            }
                }
                
                Spacer()
                
            }
            .padding(.top, 40)
//            .border(Color.white, width: 3)
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
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

struct SeparateUserView_Previews: PreviewProvider {
    static var previews: some View {
        SeparateUserView()
    }
}
