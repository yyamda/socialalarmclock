//
//  TimerView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/17/23.
//

import SwiftUI

struct TimePickerView: View {
    private let pickerViewTitlePadding: CGFloat = 4.0
    
    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>
    
    var body: some View {
            HStack(spacing: -pickerViewTitlePadding) {
                Picker(title, selection: binding) {
                    ForEach(range, id: \.self) { timeIncrement in
                        HStack {
                            // Forces the text in the Picker to be
                            // right-aligned
//                            Spacer()
                            Text("\(timeIncrement)")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                .pickerStyle(InlinePickerStyle())
                .labelsHidden()

                Text(title)
                    .fontWeight(.bold)
            }
        }
}

class TimerViewModel: ObservableObject {
    @Published var selectedHoursAmount = 10
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 10

    let hoursRange = 0...23
    let minutesRange = 0...59
    let secondsRange = 0...59
}

struct TimerView: View {
    @StateObject private var model = TimerViewModel()
    
    
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
                
                Spacer()
            }

            // Navigation Bar Things
            .navigationBarTitle (Text("add a time"), displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .font(.largeTitle)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
                        Text("Cancel")
                            .bold()
                            .foregroundColor(Color(red: 1, green: 0.85, blue: 0.33))
                            .font(.system(size: 20))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HomePageView().navigationBarBackButtonHidden(true)) {
                        Text("Add")
                            .bold()
                            .foregroundColor(Color(red: 1, green: 0.85, blue: 0.33))
                            .font(.system(size: 20))
                    }
                }
            
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
