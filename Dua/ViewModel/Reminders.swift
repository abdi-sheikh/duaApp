//
//  Reminders.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/2/21.
//

import DLLocalNotifications
import SwiftUI

class Reminders: ObservableObject {
    @Published private(set) var reminders =  Set<Reminder>()
    let defaults = UserDefaults.standard
    
    init() {
        // load out saved data
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Reminders") as? Data {
            let reminderData = try? decoder.decode(Set<Reminder>.self, from: data)
            self.reminders = reminderData ?? []
        } else {
            self.reminders = []
        }
    }
    
    func contains(_ reminder: Reminder) -> Bool {
        reminders.contains(reminder)
    }
        
    func add(_ reminder: Reminder) {
        reminders.insert(reminder)
        save()
    }
    
    func remove(_ rem: Reminder) {
        reminders.remove(rem)
        save()
    }
    
    func edit(_ id: String, _ reminder: Reminder) {
        
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(reminders) {
            defaults.set(encoded, forKey: "Reminders")
        }
    }
}
