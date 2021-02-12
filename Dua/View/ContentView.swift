//
//  ContentView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import Firebase
import SwiftUI

struct ContentView: View {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        UIKitTabView {
            HomePage().tab(title: "Home", image: "house.fill")
            ReminderPage().tab(title: "Reminders", image: "deskclock.fill")
            FavoritesPage().tab(title: "Favorites", image: "heart.fill")
            SettingsPage().tab(title: "Settings", image: "gearshape.fill")
        }
    }
    
}

