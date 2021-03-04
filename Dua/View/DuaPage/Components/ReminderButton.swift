//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct ReminderButton: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var reminder: Reminders
    var dua: Dua
    
    var body: some View {
        Button(action: {
            self.partialSheetManager.showPartialSheet({
            }) {
                RemindersModal(dua: dua)
            }
        }, label: {
            ZStack {
                Image(systemName: "deskclock.fill")
                    // if true or false hide or show filled heart w/ animation
                    .opacity(1.0)
                    .scaleEffect(1.0)
                    .animation(.easeIn)
                Image(systemName: "deskclock")
            }.font(.system(size: 20))
        })
    }
}

struct ReminderButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReminderButton(dua: Dua.init(id: "abc123", name: "Waking up", arabicDua: "الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ", translation: "All praise is for Allah who gave us life after causing us to die, and unto Him is the resurrection. (Bukhari)", transliteration: "alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor", category: "daily"))
        }
    }
}

//MARK: - Scheduling Reminders Modal

struct RemindersModal: View {
    @State var timeSelection = Date()
    @State var repeatSelection: String = "Weekly"
    @State var daysSelection = Set<String>()
    @State var reminders = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil, repetition: nil)
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var reminder: Reminders
    var dua: Dua
    let array = ["Daily", "Weekly", "Bi-weekly", "Monthly"]
    
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
                    ForEach(array, id: \.self) { day in
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
            SaveButton(timeSelection: $timeSelection, repeatSelection: $repeatSelection, daysSelection: $daysSelection, dua: dua)
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

// Save Button
struct SaveButton: View {
    @Binding var timeSelection: Date
    @Binding var repeatSelection: String
    @Binding var daysSelection: Set<String>
    @State private var showingAlert = false
    @State var reminders = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil, repetition: nil)
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var reminder: Reminders
    var dua: Dua
    
    var body: some View {
        Button(
            action: {
                withAnimation {
                    reminders.dua = dua
                    reminders.day = daysSelection
                    reminders.time = timeSelection
                    reminders.repetition = repeatSelection
                    guard reminders.day.count > 0 else {
                        return showingAlert = true
                    }
                    reminder.add(reminders)
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

