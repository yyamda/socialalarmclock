//
//  ContentView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignUpView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModel.currentUser {
                HomePageView(user: currentUser)
            }
        }
        
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
