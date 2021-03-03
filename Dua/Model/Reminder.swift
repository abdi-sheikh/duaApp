//
//  Reminder.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/2/21.
//

import Foundation

struct Reminder: Identifiable, Hashable, Codable {
    let id: String
    let dua: Dua
    let day: [String]
    let time: Date
    let repetition: String
}
