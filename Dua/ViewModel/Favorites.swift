//
//  Favorites.swift
//  Dua
//
//  Created by Abdi Sheikh on 2/18/21.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published private(set) var ids = Set<String>()
    
    let defaults = UserDefaults.standard
    
    init() {
        // load out saved data
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let idData = try? decoder.decode(Set<String>.self, from: data)
            self.ids = idData ?? []
        } else {
            self.ids = []
        }
    }
            
    func add(_ id: String) {
        ids.insert(id)
        save()
    }
    
    func remove(_ id: String) {
        ids.remove(id)
        save()
    }
    
    private func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ids) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}
