//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct ReminderButton: View {
    @EnvironmentObject private var partialSheetManager: PartialSheetManager
    @EnvironmentObject private var reminder: Reminders
    @State private var toggleIcon = false
    
    var dua: Dua
    
    var body: some View {
        Button(action: {
            partialSheetManager.showPartialSheet {
                RemindersModal(toggleIcon: $toggleIcon, dua: dua)
            }
        }) {
            ZStack {
                Image(systemName: "deskclock.fill")
                    .opacity(opacity)
                    .scaleEffect(scaleEffect)
                    .animation(.easeIn)
                Image(systemName: "deskclock")
            }
            .font(.system(size: 20))
            .foregroundColor(foregroundColor)
        }
    }
}

// MARK: - Private helpers

private extension ReminderButton {
    var opacity: Double {
        toggleIcon ? 1 : 0
    }
    
    var scaleEffect: CGFloat {
        toggleIcon ? 1.0 : 0.1
    }
    
    var foregroundColor: Color {
        toggleIcon ? .blue : .secondary
    }
}


//MARK: - Scheduling Reminders Modal

struct RemindersModal: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var reminders: Reminders
    
    @State var timeSelection = Date()
    @State var repeatSelection: String = "Weekly"
    @State var daysSelection = Set<String>()
    @State private var showingAlert = false
    @State var reminder = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil, repetition: nil)
    
    @Binding var toggleIcon: Bool


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
                        toggleIcon = reminders.contains(reminder)
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







//MARK: - Modal Components

// Days
struct DaysOfTheWeekButtons: View {
    @Binding var daysSelection: Set<String>
    let days = ["Sun","Mon","Tues","Wed","Thur","Fri","Sat"]
    
    var body: some View {
        HStack {
            ForEach(days, id: \.self) { day in
                Text(day)
                    // setup for this is a mess but it is because we want to make it work on all screens
                    .fontWeight(.light)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .frame(maxWidth: 125, minHeight: 45)
                    .background(daysSelection.contains(day) ? Color.blue : Color.clear)
                    .foregroundColor(daysSelection.contains(day) ? Color.white : Color.blue)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .onTapGesture {
                        
                        withAnimation {
                            // add or remove to value that will be saved
                            if daysSelection.contains(day) {
                                daysSelection.remove(day)
                            } else {
                                daysSelection.insert(day)
                            }
                        }
                    }
            }
        }.padding(.horizontal)
    }
}
