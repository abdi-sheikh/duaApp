//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import SwiftUI

struct ReminderButton: View {
    @State private var wakeUp = Date()
    @State var selection: String = "Weekly"
    
    var array: [String] = ["Daily", "Weekly", "Bi-weekly", "Monthly"]
    var body: some View {
            VStack {
                HStack {
                    dailyButtons(day: "Sun")
                    dailyButtons(day: "Mon")
                    dailyButtons(day: "Tues")
                    dailyButtons(day: "Wed")
                    dailyButtons(day: "Thur")
                    dailyButtons(day: "Fri")
                    dailyButtons(day: "Sat")
                }.padding(.horizontal)
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .padding(.horizontal)
                HStack(alignment: .center) {
                    Text("Repeat")
                    Spacer()
                    Picker(selection, selection: $selection) {
                        ForEach(array, id: \.self) { day in
                            Text(day).tag(day)
                        }
                    }
                    .frame(width: 95, height: 35)
                    .pickerStyle(MenuPickerStyle())
                    .background(
                        Color(.lightGray)
                            .opacity(0.2)
                    )
                    .cornerRadius(5)
                }.padding(.horizontal)
                Button("Save") { }
                .foregroundColor(.blue)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                )
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
                    .fontWeight(.light)
                    .padding(4)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: 125, minHeight: 45)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 70)
                            .stroke(Color.gray, lineWidth: 1)
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
