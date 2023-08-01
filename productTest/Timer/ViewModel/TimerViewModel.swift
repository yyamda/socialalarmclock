//
//  TimerViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 8/1/23.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var selectedHoursAmount = 10
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 10

    let hoursRange = 0...23
    let minutesRange = 0...59
    let secondsRange = 0...59
}
