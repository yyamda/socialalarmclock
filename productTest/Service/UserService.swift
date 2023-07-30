//
//  UserService.swift
//  productTest
//
//  Created by Yuta Yamada on 7/29/23.
//

import Foundation
import Firebase
struct UserService {
    
    func fetchAllUsers() async throws -> [User] {
        var users = [User]()
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let user = try? doc.data(as: User.self) else { return users }
            users.append(user)
        }
        
        return users
    }
}
