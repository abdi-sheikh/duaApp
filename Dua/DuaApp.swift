//
//  DuaApp.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import Firebase
import PartialSheet
import SwiftUI
import UserNotifications

@main
struct DuaApp: App {
    
    init() {
        FirebaseApp.configure()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                
            }
        }
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
