//
//  User.swift
//  productTest
//
//  Created by Yuta Yamada on 7/29/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    // codable: allows conversion to and from JSON files
    let id: String // "id" will not change after initialization
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Benny123", profileImageUrl: "benny", fullname: "Benny Liang", email: "benny@gmail.com")
    
    
    ]
}
