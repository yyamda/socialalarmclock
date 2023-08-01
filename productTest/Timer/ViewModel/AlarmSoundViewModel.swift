//
//  AlarmSoundViewModel.swift
//  productTest
//
//  Created by Yuta Yamada on 8/1/23.
//

import Foundation
import Firebase

class AlarmViewModel: ObservableObject {
    @Published var hour = 0
    @Published var minute = 0
    @Published var currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }

    
    func updateAlarmTime(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
        
        print(self.hour)
        print(self.minute)
    }
    
    func updateUserAlarmData() async throws {
        
        // fetch the current user data
        let userDocument = Firestore.firestore().collection("users").document(currentUser.id)
            let documentSnapshot = try await userDocument.getDocument()
            guard var data = documentSnapshot.data() else {
                // Handle the case where the document does not exist or is empty.
                return
            }
        
        // initialize an Alarm Sound Object
        let alarm = AlarmSound(isOn: true, hour: self.hour, minute: self.minute)
        
        // get user's current alarmSounds
        if var alarmSounds = data["alarmSounds"] as? [[String: Any]] {
                // Append the new AlarmSound data to the array
                let encoder = JSONEncoder()
                encoder.keyEncodingStrategy = .convertToSnakeCase
                let alarmData = try encoder.encode(alarm)
                let alarmDict = try JSONSerialization.jsonObject(with: alarmData, options: []) as! [String: Any]
                alarmSounds.append(alarmDict)
                data["alarmSounds"] = alarmSounds
                print("This has started")
            } else {
                // If the alarmSounds key doesn't exist or is not an array, create a new array and add the alarm
                let encoder = JSONEncoder()
                encoder.keyEncodingStrategy = .convertToSnakeCase
                let alarmData = try encoder.encode(alarm)
                let alarmDict = try JSONSerialization.jsonObject(with: alarmData, options: []) as! [String: Any]
                data["alarmSounds"] = [alarmDict]
                print("List has already been created")
            }
        
        
        // check in firestore, see if Alarm Sound Object is in there, if not, add it in.
        try await userDocument.setData(data, merge: true)
    }
    
  
}
