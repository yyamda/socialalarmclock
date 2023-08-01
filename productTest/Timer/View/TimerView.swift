//
//  TimerView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/17/23.
//

import SwiftUI


struct TimerView: View {
    let currentUser: User
    @Environment(\.dismiss) var dismiss
    @StateObject private var model = TimerViewModel()
    @StateObject var viewModel: AlarmViewModel
    
    init(currentUser: User) {
        self.currentUser = currentUser
        self._viewModel = StateObject(wrappedValue: AlarmViewModel(currentUser: currentUser))
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    TimePickerView(title: "",
                        range: model.hoursRange,
                        binding: $model.selectedHoursAmount)
                    TimePickerView(title: "",
                        range: model.minutesRange,
                        binding: $model.selectedMinutesAmount)

                }
                .padding(.all, 32)
                .frame(width: 390, height: 300)
                .background(.black)
                .foregroundColor(.white)
                
//                .border(Color.white, width: 2)
                
                HStack {

                    Button {
                        Task {
                            viewModel.updateAlarmTime(hour: model.selectedHoursAmount, minute: model.selectedMinutesAmount)

                            try await viewModel.updateUserAlarmData()
                        }

                        dismiss()

                    } label: {
                        Text("Save")
                    }
                }
                
                Spacer()
            }

            // Navigation Bar Things
            .navigationBarTitle (Text("add a time"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomePageView(currentUser: currentUser).navigationBarBackButtonHidden(true)) {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 30, height: 30)
                           
                    }
                    
                }
                
            }
            
        }
        .environment(\.colorScheme, .dark)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(currentUser: User.MOCK_USERS[0])
    }
}

