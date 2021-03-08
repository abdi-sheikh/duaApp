//
//  DaysOfTheWeekButtons.swift
//  Dua
//
//  Created by jabari on 3/7/21.
//

import SwiftUI

// MARK: - DaysOfTheWeekButtons

struct DaysOfTheWeekButtons: View {
    @Binding var daysSelection: Set<String>
    
    var body: some View {
        HStack {
            ForEach(days, id: \.self) { day in
                Text(day)
                    .fontWeight(.light)
                    .minimumScaleFactor(minScaleFactor)
                    .lineLimit(lineLimit)
                    .frame(maxWidth: maxFrameWidth, minHeight: minFrameWidth)
                    .background(backgroundColor(for: day))
                    .foregroundColor(foregroundColor(for: day))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(overlayStrokeColor, lineWidth: overlayLineWidth))
                    .onTapGesture { withAnimation { handleDayTapped(day) } }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Private helpers

private extension DaysOfTheWeekButtons {
    var lineLimit: Int { 1 }
    var maxFrameWidth: CGFloat { 125 }
    var minFrameWidth: CGFloat { 45 }
    var minScaleFactor: CGFloat { 0.01 }
    var overlayLineWidth: CGFloat { 1 }
    var overlayStrokeColor: Color { .gray }
    var days: [String] { ["Sun", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat"] }
    
    func isSelected(_ day: String) -> Bool {
        return daysSelection.contains(day)
    }
    
    func backgroundColor(for day: String) -> Color {
        return isSelected(day) ? .blue : .clear
    }
    
    func foregroundColor(for day: String) -> Color {
        return isSelected(day) ? .white : .blue
    }
    
    func handleDayTapped(_ day: String) {
        if daysSelection.contains(day) {
            daysSelection.remove(day)
        } else {
            daysSelection.insert(day)
        }
    }
}
