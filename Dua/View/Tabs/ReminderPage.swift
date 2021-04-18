//
//  ReminderPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/21/21.
//

import SwiftUI

struct ReminderPage: View {
    @EnvironmentObject private var reminders: Reminders
    @EnvironmentObject private var duaViewModel: DuaViewModel
    var color: String
    var image: String
    
    var body: some View {
        (reminders.reminders.isEmpty ? fallbackView.any : remindersListView.any)
            .navigationTitle("Reminders")
    }
}
private extension ReminderPage {
    var fallbackView: some View {
        VStack{
            Spacer()
            Image(systemName: "deskclock")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            Text(String.fallbackTitle)
                .fontWeight(.light)
                .padding(.horizontal, 44)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
    
    var remindersListView: some View {
        List {
            ForEach(reminders.reminders
                        .sorted{ $0.dua?.name ?? ""  < $1.dua?.name ?? ""}, id: \.self) { reminder in
                NavigationLink(
                    destination: DuaView(dua: reminder.dua!, categoryColor: Color(color))) {
                    VStack(alignment: .leading){
                        Text(reminder.dua?.name.capitalized ?? "")
                            .foregroundColor(.primary)
                            .fontWeight(.light)
                            .lineLimit(2)
                        HStack {
                            Text(reminder.time!, style: .time)
                                .fontWeight(.light)
                                .font(.footnote)
                        }
                    }
                }
            }
        }
    }

}


// MARK: - String constatns

fileprivate extension String {
    static let fallbackTitle = "Add reminders for quick and easy notifcations on your daily dua's"
}
