//
//  UserService.swift
//  productTest
//
//  Created by Yuta Yamada on 7/29/23.
//

import Foundation
import Firebase
struct UserService {
    

    static func fetchAllUsers() async throws -> [User] { 
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self) })
    }
}
