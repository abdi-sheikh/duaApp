//
//  Reminders.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/2/21.
//

import SwiftUI

class Reminders: ObservableObject {
    @Published var reminders = Set<Reminder>()
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
    
    func isEmpty() -> Bool {
        reminders.count < 1
    }
    
    func contains(_ reminder: Reminder) -> Bool {
        reminders.contains(reminder)
    }
    
    func add(_ reminder: Reminder) {
        reminders.insert(reminder)
        save()
    }
    
    func remove(_ reminder: Reminder) {
        reminders.remove(reminder)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(reminders) {
            defaults.set(encoded, forKey: "Reminders")
        }
    }
}
