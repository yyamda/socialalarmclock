//
//  ContentViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 7/28/23.
//

import Foundation
import Firebase
import Combine



class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    // this is a shared variable, connected to AuthService file, that sees if a user is logged in
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    // listens for the userSession. and changes the userSession variable accordingly
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
