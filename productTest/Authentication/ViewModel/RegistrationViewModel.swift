//
//  RegistrationViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 7/28/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var first = ""
    @Published var last = ""
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username, first: first, last: last)

    }
}
