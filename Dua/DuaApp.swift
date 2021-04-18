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
        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .badge, .sound]
            ) { granted, error in
                if granted == true && error == nil {
                    print("Notifications permitted")
                } else {
                    print("Notifications not permitted")
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
