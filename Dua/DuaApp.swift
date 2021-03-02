//
//  DuaApp.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import PartialSheet
import SwiftUI

@main
struct DuaApp: App {
    var body: some Scene {
        WindowGroup {
            let sheetManager: PartialSheetManager = PartialSheetManager()
            ContentView()
                .environmentObject(DuaViewModel())
                .environmentObject(sheetManager)
            
        }
    }
}
