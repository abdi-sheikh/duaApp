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
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            ReminderPage()
                .tabItem {
                    Image(systemName: "deskclock.fill")
                    Text("Reminders")
                }.tag(1)
            Text("Favorites")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }.tag(2)
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }.tag(3)
        }
        .font(.headline)
    }
    
}

