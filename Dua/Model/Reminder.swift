//
//  Reminder.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/2/21.
//

import Foundation

struct Reminder: Identifiable, Hashable, Codable {
    var id: String?
    var dua: Dua?
    var day: Set<String>
    var time: Date?
    var repetition: String?
}
