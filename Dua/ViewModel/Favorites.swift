//
//  Favorites.swift
//  Dua
//
//  Created by Abdi Sheikh on 2/18/21.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var duas = Set<Dua>()
    
    let defaults = UserDefaults.standard
    
    init() {
        // load out saved data
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let duaData = try? decoder.decode(Set<Dua>.self, from: data)
            self.duas = duaData ?? []
        } else {
            self.duas = []
        }
    }
    
    func isEmpty() -> Bool {
        duas.count < 1
    }
    
    func contains(_ dua: Dua) -> Bool {
        duas.contains(dua)
    }
    
    func add(_ dua: Dua) {
        duas.insert(dua)
        save()
    }
    
    func remove(_ dua: Dua) {
        duas.remove(dua)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(duas) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}
