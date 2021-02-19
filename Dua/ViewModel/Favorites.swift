//
//  Favorites.swift
//  Dua
//
//  Created by Abdi Sheikh on 2/18/21.
//

import SwiftUI

class Favorites: ObservableObject {
    private var duas: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        // load out saved data
        
        self.duas = []
    }
    
    
    func contains(_ dua: Dua) -> Bool {
        duas.contains(dua.id)
    }
    
    func add(_ dua: Dua) {
        objectWillChange.send()
        duas.insert(dua.id)
        save()
    }
    
    func remove(_ dua: Dua) {
        objectWillChange.send()
        duas.remove(dua.id)
        save()
    }
    
    func save() {
        
    }
}
