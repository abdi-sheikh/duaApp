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
    @EnvironmentObject private var partialSheetManager: PartialSheetManager
    @EnvironmentObject private var reminders: Reminders
    
    @State private var timeSelection = Date()
    @State private var daysSelection = Set<String>()
    @State private var showingAlert = false
    @State private var reminder = Reminder(id: UUID().uuidString, dua: nil, day: [], time: nil)
    
    
    var dua: Dua
    
    var body: some View {
        VStack(spacing: 10) {
            // Reminders
            ForEach(reminders.reminders.filter{ $0.dua == dua }, id: \.self) {rem in
                HStack{
                    Text(rem.time!, style: .time)
                        .fontWeight(.thin)
                    Text(rem.day.reduce("") { $0 + $1 + ", " })
                        .fontWeight(.thin)
                        
                    Spacer()
                    Button(action: {
                        if rem.day.count < 7 {
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(String(describing: rem.id))-[\(rem.day.count - 1)]"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(String(describing: rem.id))-[\(rem.day.count - 1)]"])
                        } else {
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(String(describing: rem.id))"])
                            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(String(describing: rem.id))"])
                        }
                        reminders.remove(rem)
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                    })
                    
                    
                }.padding(.horizontal, 25)
                
            }
            
            
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
        let scheduledDays = getNumberDays(days: reminder.day)
        
        if scheduledDays.count == 7 {
            let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: time)
            
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
            let request = UNNotificationRequest(identifier: "\(reminder.id!)", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { (error) in
               if error != nil {
                 print("failure")
               }
            }
        } else {
            for scheduledDay in scheduledDays {
                let hour = Calendar.current.component(.hour, from: time)
                let minute = Calendar.current.component(.minute, from: time)
                
                let day = DateComponents(hour: hour, minute: minute, weekday: scheduledDay)
                let trigger = UNCalendarNotificationTrigger(dateMatching: day, repeats: true)
                let request = UNNotificationRequest(identifier: "\(reminder.id!)-[\(scheduledDay)]", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if error != nil {
                      print("failure")
                    }
                 }
            }
        }
        
        UNUserNotificationCenter.current().getPendingNotificationRequests { pending in
            for pen in pending {
                print(pen)
            }
        }
    }
    
    func getNumberDays(days: Set<String>) -> [Int] {
        var numDays: [Int] = []
        for day in days {
            switch day {
            case "Sun":
                numDays.append(1)
            case "Mon":
                numDays.append(2)
            case "Tues":
                numDays.append(3)
            case "Wed":
                numDays.append(4)
            case "Thur":
                numDays.append(5)
            case "Fri":
                numDays.append(6)
            case "Sat":
                numDays.append(7)
            default:
                numDays.append(0)
            }
        }
        return numDays
    }
    
}
