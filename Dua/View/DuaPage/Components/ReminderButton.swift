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
    
    var dua: Dua
    
    var body: some View {
        Button(action: {
            partialSheetManager.showPartialSheet {
                RemindersModal(dua: dua)
            }
        }) {
            ZStack {
                Image(systemName: "deskclock")
                    .animation(.easeIn)
            }
            .font(.system(size: 20))
            .foregroundColor(foregroundColor)
        }
    }
}

// MARK: - Private helpers

private extension ReminderButton {
    var isReminder: Bool {
        reminder.reminders.contains{$0.dua == dua}
    }
    
    var opacity: Double {
        isReminder ? 1 : 0
    }
    
    var scaleEffect: CGFloat {
        isReminder ? 1.0 : 0.1
    }
    
    var foregroundColor: Color {
        isReminder ? .blue : .secondary
    }
}
