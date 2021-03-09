//
//  DuaApp.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import Firebase
import PartialSheet
import SwiftUI

@main
struct DuaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DuaViewModel())
                .environmentObject(Favorites())
                .environmentObject(Reminders())
                .environmentObject(PartialSheetManager())
                .environment(\.horizontalSizeClass, .compact)
        }
    }
}
