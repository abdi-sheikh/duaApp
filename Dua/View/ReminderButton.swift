//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import SwiftUI

struct ReminderButton: View {
    @State private var wakeUp = Date()
    var body: some View {
        VStack{

            HStack {
                dailyButtons(day: "Mon")
                dailyButtons(day: "Tues")
                dailyButtons(day: "Wed")
                dailyButtons(day: "Thur")
                dailyButtons(day: "Fri")
                dailyButtons(day: "Sat")
                dailyButtons(day: "Sun")
            }

            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            HStack {
                Text("Repeat")
                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Daily").tag(1)
                    Text("Bi-weekly").tag(1)
                    Text("Monthly").tag(2)
                    Text("Yearly").tag(3)
                }
            }
        }
    }
}

struct dailyButtons: View {
    var day: String
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Text(day)
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
                    .padding()
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    
            }
        }
    }
}
struct ReminderButton_Previews: PreviewProvider {
    static var previews: some View {
        ReminderButton()
    }
}
