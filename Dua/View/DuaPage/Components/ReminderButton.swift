//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct ReminderButton: View {
    @EnvironmentObject private var partialSheetManager: PartialSheetManager
    @EnvironmentObject private var reminder: Reminders
    @State private var toggleIcon = false
    
    var dua: Dua
    
    var body: some View {
        Button(action: {
            partialSheetManager.showPartialSheet {
                RemindersModal(toggleIcon: $toggleIcon, dua: dua)
            }
        }) {
            ZStack {
                Image(systemName: "deskclock.fill")
                    .opacity(opacity)
                    .scaleEffect(scaleEffect)
                    .animation(.easeIn)
                Image(systemName: "deskclock")
            }
            .font(.system(size: 20))
            .foregroundColor(foregroundColor)
        }
    }
}

// MARK: - Private helpers

private extension ReminderButton {
    var opacity: Double {
        toggleIcon ? 1 : 0
    }
    
    var scaleEffect: CGFloat {
        toggleIcon ? 1.0 : 0.1
    }
    
    var foregroundColor: Color {
        toggleIcon ? .blue : .secondary
    }
}
