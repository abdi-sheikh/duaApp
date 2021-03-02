//
//  Dua.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/1/21.
//

import FirebaseFirestoreSwift
import SwiftUI

struct Dua : Identifiable, Hashable, Codable {
    
    var id: String
    var name: String
    var arabicDua: String
    var translation: String
    var transliteration: String
    var category: String
}
