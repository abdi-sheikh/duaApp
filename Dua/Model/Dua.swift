//
//  Dua.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/1/21.
//

import SwiftUI

struct Dua: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let arabicDua: String
    let translation: String
    let transliteration: String
    let category: String
}
