//
//  RemindersModal.swift
//  Dua
//
//  Created by jabari on 3/7/21.
//

import DLLocalNotifications
import PartialSheet
import SwiftUI

//MARK: - Scheduling Reminders Modal

struct RemindersModal: View {
    @EnvironmentObject private var partialSheetManager: PartialSheetManager
    @EnvironmentObject private var reminders: Reminders
    
    @State private var timeSelection = Date()
    @State private var daysSelection = Set<String>()
    @State private var showingAlert = false
    @State private var reminder = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil)
    
    
    var dua: Dua
    
    var body: some View {
        VStack {
            // Days
            DaysOfTheWeekButtons(daysSelection: $daysSelection)
            
            // Time - Date picker
            timePicker
            
            // Save Button
            Button{
                withAnimation { save() }
            } label: {
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

private extension RemindersModal {
    func save() {
        reminder.dua = dua
        reminder.day = daysSelection
        reminder.time = timeSelection
        guard reminder.day.count > 0 else {
            return showingAlert = true
        }
        reminders.add(reminder)
        
        scheduleReminder(reminder.time!)
        partialSheetManager.closePartialSheet()
    }
    
    var timePicker: some View {
        DatePicker("Please enter a time", selection: $timeSelection, displayedComponents: .hourAndMinute)
            .padding(.horizontal)
    }
    
    func scheduleReminder(_ time: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Its time to make your dua!"
        content.body = dua.name
        content.sound = .default
        content.launchImageName = "AppIcon"
        let scheduledDays = getNumberDays(days: reminder.day)
        let scheduler = DLNotificationScheduler()
        
        if scheduledDays.count == 7 {
            let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: time)
            let notification = DLNotification(identifier: "\(reminder.id!)", alertTitle: dua.name, alertBody: dua.arabicDua, fromDateComponents: triggerDate, repeatInterval: .daily)
            scheduler.scheduleNotification(notification: notification)
        } else {
            for scheduledDay in scheduledDays {
                let specficDay = Calendar.current.date(byAdding: .day, value: scheduledDay, to: time)!
                let triggerDate = Calendar.current.dateComponents([.day, .hour, .minute], from: specficDay)
                let notification = DLNotification(identifier: "\(reminder.id!)-\(scheduledDay - 1)", alertTitle: dua.name, alertBody: dua.arabicDua, fromDateComponents: triggerDate, repeatInterval: .weekly)
                scheduler.scheduleNotification(notification: notification)
            }
        }
        scheduler.scheduleAllNotifications()
    }
    
    func getNumberDays(days: Set<String>) -> [Int] {
        var numDays: [Int] = []
        for day in days {
            switch day {
            case "Mon":
                numDays.append(1)
            case "Tues":
                numDays.append(2)
            case "Wed":
                numDays.append(3)
            case "Thur":
                numDays.append(4)
            case "Fri":
                numDays.append(5)
            case "Sat":
                numDays.append(6)
            case "Sun":
                numDays.append(7)
            default:
                numDays.append(0)
            }
        }
        return numDays
    }
    
}
