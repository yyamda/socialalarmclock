//
//  TimerPickerView.swift
//  productTest
//
//  Created by Yuta Yamada on 8/1/23.
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

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView(title: "", range: 0 ... 10, binding: Binding.constant(5))
    }
}
