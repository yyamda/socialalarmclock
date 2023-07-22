//
//  FriendsPageView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/21/23.
//

import SwiftUI

struct FriendsPageView: View {
    @State private var myActivityTab = true
    @State private var newWakeOpen = false
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        myActivityTab = true
                    }){
                        Text("Activity")
                            .font(.system(size: 26, weight: .bold))
                            .padding(.leading, 20)
                            .foregroundColor(myActivityTab ? .white : Color(red: 0.64, green: 0.64, blue: 0.64))
                    }
                    .padding(.trailing, 80)
                    
                    Spacer()
                    
                    Button(action: {
                        myActivityTab = false
                    }){
                        Text("Friends")
                            .font(.system(size: 26, weight: .bold))
                            .padding(.trailing, 20)
                            .foregroundColor(myActivityTab ? Color(red: 0.64, green: 0.64, blue: 0.64) : .white)
                    }
                    Spacer()
                }
                .frame(width: 390, height: 20)
                .padding(.top, 10)
//                .border(.white, width: 2)
                
                HStack {
                    Rectangle()
                        .frame(width: 200, height: 3)
                        .foregroundColor(myActivityTab ? .white : Color(red: 0.64, green: 0.64, blue: 0.64))
                    Rectangle()
                        .frame(width: 200, height: 3)
                        .foregroundColor(myActivityTab ? Color(red: 0.64, green: 0.64, blue: 0.64): .white)
                }
                .padding(.top, 2)
                
                if myActivityTab {
                    VStack {
                        Button(action: {
                            // Wake up call Action
                        }) {
                            Text("+ Send a Wake up Call! ")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width: 300, height: 70)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(40)
                                .padding(.top, 20)
                                }
                        
                        Button(action: {
                            // Wake up call Action
                        }) {
                            Text("+ Request a Wake up Call! ")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width: 300, height: 70)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(40)
                                .padding(.top, 20)
                                }
                        
                        // New Wake Calls Sent To You drop down
                        VStack {
                            Button(action: {
                                newWakeOpen.toggle()
                            })
                            {
                                HStack {
                                    Text("New Wake Calls Sent To You")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    if (newWakeOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 30, height: 20)
                                    }
                                    if (!newWakeOpen) {
                                        Image("GrayDownToggle")
                                            .resizable()
                                            .frame(width: 30, height: 20)
                                            .rotationEffect(.degrees(180))
                                    }
                                }
                                .padding(.leading, 30)
                                .padding(.trailing, 20)
                                .padding(.top, 25)
                            }
                            if newWakeOpen {
                                ScrollView {
                                    LazyVStack(spacing: 0) {
                                        ForEach(0 ... 10, id:\.self) {
                                            user in
                                            HStack {
                                                    Button(action: {
                                                        print("Button tapped")
                                                    }) {
                                                        Image("PlayButton")
                                                        .renderingMode(.original)
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .clipShape(Circle())
                                                    }
                                                    .padding(.trailing, 10)
                                                    .padding(.leading, 30)
                                                        
                                                    Image("Lucas")
                                                        .renderingMode(.original)
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                        .padding(.trailing, 10)
                                                        
                                                    HStack {
                                                        VStack(alignment: .leading) {
                                                            Text("my great depth of voice")
                                                                .font(.system(size: 18, weight: .semibold))
                                                                .foregroundColor(.white)
                                                            Text("Lucas Omori")
                                                                .font(.system(size: 10))
                                                                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                                        }
                                                        Spacer()
                                                    }
                                                    .frame(width: 200, height: 40)
//                                                    .border(.white, width: 2)
                                                    
                                                    Button(action: {
                                                        // action here
                                                    }) {
                                                        Text("+ Add")
                                                            .font(.system(size: 15, weight: .bold))
                                                            .foregroundColor(Color.black)
                                                            .frame(width: 60, height: 40)
                                                            .background(Color.white)
                                                            .cornerRadius(40)
                                                            .padding(.trailing, 20)
                                                    }
                                                }
                                                .frame(width: nil, height: 70)
                                                .background(.black)
//                                                .border(.white, width: 2)
                                                
                                        }
                                    }
                                }
                                .frame(maxHeight: 150)
                            }
                            
                            Rectangle()
                                .frame(width: 350, height: 2)
                                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                        }
                        
                        // Social Feed
                        VStack {
                            HStack {
                                Text("Social Feed")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color.white)
                                   
                                Spacer()
                            }
                            
                            ScrollView {
                                LazyVStack(spacing: 0) {
                                    ForEach(0 ... 10, id:\.self) {
                                        user in
                                        VStack {
                                            HStack{
                                                Text("You")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.blue)
                                                Text("send a sound to")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.white)
                                                Text("Jared")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.blue)
                                                Spacer()
                                            }
                                            HStack{
                                                Text("The date or sound")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color.gray)
                                                
                                                Spacer()
                                            }
                                            
                                            }
                                            .frame(width: nil, height: 50)
                                            .background(.black)
                                            .padding(.bottom, 5)
//                                                .border(.white, width: 2)
                                            
                                    }
                                }
                            }
                            
                        }
                        .padding(.top, 20)
                        .padding(.leading, 30)
                        
                        
                    }
                }
                if (!myActivityTab) {
                    Text("Nope not me")
                        .font(.system(size: 26, weight: .bold))
                }
                
                Spacer()
            }
            
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(180))
                    }
                    
                }
                
            }

        }
        .environment(\.colorScheme, .dark)
        
    }
        
}

struct FriendsPageView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPageView()
    }
}
