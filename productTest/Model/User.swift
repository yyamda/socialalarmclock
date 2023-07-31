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
    let email: String
    var profileImageUrl: String?
    var first: String
    var last: String
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Benny123",  email: "benny@gmail.com", profileImageUrl:
                "Tyler", first: "Benny", last: "Liang")

    ]
}
