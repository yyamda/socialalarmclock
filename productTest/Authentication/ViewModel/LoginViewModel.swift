//
//  LoginViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 7/29/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.signIn(withEmail: email, password: password)
        
        email = ""
        password = ""
    }
}
