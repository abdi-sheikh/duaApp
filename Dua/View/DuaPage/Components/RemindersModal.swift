//
//  RemindersModal.swift
//  Dua
//
//  Created by jabari on 3/7/21.
//

import PartialSheet
import SwiftUI

//MARK: - Scheduling Reminders Modal

struct RemindersModal: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var reminders: Reminders
    
    @State var timeSelection = Date()
    @State var repeatSelection: String = "Weekly"
    @State var daysSelection = Set<String>()
    @State private var showingAlert = false
    @State var reminder = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil, repetition: nil)
    

    var dua: Dua
    let repeatArray = ["Daily", "Weekly", "Bi-weekly", "Monthly"]
    
    var body: some View {
        VStack {
            
            
            // Days
            DaysOfTheWeekButtons(daysSelection: $daysSelection)
            
            
            // Time - Date picker
            DatePicker("Please enter a time", selection: $timeSelection, displayedComponents: .hourAndMinute)
                .padding(.horizontal)
            
            
            // Repeat
            HStack(alignment: .center) {
                Text("Repeat")
                Spacer()
                Picker(repeatSelection, selection: $repeatSelection) {
                    ForEach(repeatArray, id: \.self) { day in
                        Text(day).tag(day)
                    }
                }
                .frame(width: 93, height: 35)
                .pickerStyle(MenuPickerStyle())
                .background(
                    Color(.lightGray)
                        .opacity(0.2)
                )
                .cornerRadius(5)
            }.padding(.horizontal)
            
            
            // Save Button
            Button(
                action: {
                    withAnimation {
                        reminder.dua = dua
                        reminder.day = daysSelection
                        reminder.time = timeSelection
                        reminder.repetition = repeatSelection
                        guard reminder.day.count > 0 else {
                            return showingAlert = true
                        }
                        reminders.add(reminder)
                        partialSheetManager.closePartialSheet()
                    }
            }) {
                Text("Save")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                // if a day is not selected you cannot save data
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Please select a day"), message: Text("scheduling error"), dismissButton: .default(Text("Ok")))
            }
            
        }
    }
}
