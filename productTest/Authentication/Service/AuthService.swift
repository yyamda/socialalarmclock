//
//  AuthService.swift
//  productTest
//
//  Created by Yuta Yamada on 7/28/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    // determines whether or not a user is signed in or not
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    // initializes the AuthService class, which checks if user is signed in
    static let shared = AuthService()
    
    init() {
        // userdata, whether or not the user is logged in.
        Task {try await loadUserData() }
    }
    
    @MainActor
    func signIn(withEmail email: String, password: String) async throws {
        do {
            // firebase function to create a user in the Authentication
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        
        } catch {
            // code for when auth().createUser doesn't work
            print("DEBUG: Failed to log in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
//        print("Email is \(email)")
//        print("Password is \(password)")
//        print("username is \(username)")
        do {
            // firebase function to create a user in the Authentication
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            // storing userData into the Database (separate from Authentication)
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        
        } catch {
            // code for when auth().createUser doesn't work
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: HELLOOO THIS IS WORKING")
        guard let currentUid = userSession?.uid else { return }
        print("DEBUG: \(currentUid)")
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
//        print("DEBUG: Snapshot data is \(snapshot.data())")
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    // signs a user out
    func signout() {
        // Auth library signout function. signout on the backend.
        try? Auth.auth().signOut()
        // change UserSession so UI (frontend) knows user has signed out
        self.userSession = nil
        
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}

