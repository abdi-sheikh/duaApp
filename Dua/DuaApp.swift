//
//  DuaApp.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import SwiftUI

@main
struct DuaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DuaViewModel())
        }
    }
}
