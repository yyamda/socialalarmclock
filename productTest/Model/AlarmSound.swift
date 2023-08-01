//
//  AlarmSound.swift
//  productTest
//
//  Created by Yuta Yamada on 8/1/23.
//

import Foundation

struct AlarmSound: Hashable, Encodable {
    var isOn: Bool
    var hour: Int
    var minute: Int
}
