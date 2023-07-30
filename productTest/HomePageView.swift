//
//  HomePageView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/16/23.
//

import SwiftUI

struct HomePageView: View {
    
    
    @State private var soundOpen = false
    @State private var timeOpen = false
    @State private var soundToggle = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.white))]

        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Helvetica-Bold", size: 26)!]
    }
    
    var body: some View {
        NavigationView {
            // Set Your Sounds + Set Your Time
            VStack(alignment: .leading) {
                
                // Set Your Sounds
                VStack(alignment: .leading) {
                        Button(action: {
                            withAnimation {
                                soundOpen.toggle()
                            }
                        }) {
                            HStack {
                                Text("Set Your Sounds + ")
                                        .font(.system(size: 30))
                                        .foregroundColor(.black)
                                        .bold()
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    Image(soundOpen ? "DownToggle" : "UpToggle")
                                        .resizable()
                                        .frame(width: 35, height: 25)
                                        .padding(.horizontal)
                                    
                                    
                                }
                            }
                            .frame(width: 380, height: 70)
                            
                            
            if soundOpen {
                            
                ScrollView {
                    LazyVStack(spacing: 0) {
                        Text("+ request a sound")
                            .frame(width: 390, height: 40)
                            .font(.system(size: 15, weight: .bold))
                            .background(.black)
                            .padding(.top, 5)
                            
                        ForEach(0 ... 10, id:\.self) { user in
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
                                    
                                HStack {VStack(alignment: .leading) {
                                    Text("Ted Wang")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                        .bold()
                                    Text("track 1 what a great melody")
                                        .font(.system(size: 10))
                                        .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                                        }
                                    Spacer()
                                }
                                .frame(width: 200, height: 40)
//                                        .border(Color.white, width: 2)

                                    
                                Toggle("", isOn: $soundToggle)
                                    .padding(.trailing, 30)
                                }
                                .frame(width: 390, height: 70)
                                .background(.black)
                        }
                    }
                }
                                .frame(maxHeight: 250)
                            
                            }
                        }
//                            .padding()
                        .background(Color(red: 0.85, green: 0.84, blue: 0.84))
                        .cornerRadius(30)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.top, 40)
                
                // Set Your Time
                VStack(alignment: .leading) {
                        Button(action: {
                            withAnimation {
                                timeOpen.toggle()
                            }
                        }) {
                            HStack {
                                Text("Set Your Time")
                                        .font(.system(size: 30))
                                        .foregroundColor(.black)
                                        .bold()
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    Image(timeOpen ? "DownToggle" : "UpToggle")
                                        .resizable()
                                        .frame(width: 35, height: 25)
                                        .padding(.horizontal)
                                    
                                    
                                }
                            }
                            .frame(width: 380, height: 70)
                            
                            
            if timeOpen {
                            
                ScrollView {
                    LazyVStack(spacing: 0) {
                        NavigationLink(destination: TimerView().navigationBarBackButtonHidden(true)) {
                            Text("+ add a time")
                                .frame(width: 390, height: 40)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .background(.black)
                                .padding(.top, 5)
                        }
                        
                        
                        ForEach(0 ... 10, id:\.self) {
                            user in
                                HStack {
                                    Text("08:30 AM")
                                        .padding(.leading, 10)
                                    Spacer()
                                    
                                    Toggle("", isOn: $soundToggle)
                                        .padding(.trailing, 30)
                                }
                                .frame(width: 390, height: 70)
                                .background(.black)
                        }
                    }
                }
                .frame(maxHeight: 250)
                            
                            }
                        }
                        .background(Color(red: 0.85, green: 0.84, blue: 0.84))
                        .cornerRadius(30)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.top, 20)
                
                Spacer()
                    
                
            }
            
            // Navigation Bar Things
            .navigationBarTitle (Text("Wake Me Up!!"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: UserAccountView().navigationBarBackButtonHidden(true)) {
                        Image("FriendsIcon")
                            .resizable()
                            .frame(width: 55, height: 35)
                                }
                    }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: UserAccountView().navigationBarBackButtonHidden(true)) {
                        Image("AccountUserIcon")
                            .resizable()
                            .frame(width: 45, height: 45)
                                    }
                            }
                }
        }
        .environment(\.colorScheme, .dark)
    }
    
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
