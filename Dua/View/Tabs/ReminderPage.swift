//
//  ReminderPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/21/21.
//

import SwiftUI

struct ReminderPage: View {
    @EnvironmentObject var reminders: Reminders
    var color: String
    var image: String
    
    var body: some View {
            
//            if reminders.reminders.isEmpty {
//                VStack{
//                    Spacer()
//                    Image(systemName: "deskclock")
//                        .resizable()
//                        .frame(width: 100, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.gray)
//                    Text("Add reminders for quick").fontWeight(.light)
//                    Text("and easy notifcations on your daily dua's").fontWeight(.light)
//                    Spacer()
//                }.navigationBarTitle("Reminders")
//            } else {
                List{
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
                                    Text(reminder.time!, style: .time).font(.footnote).fontWeight(.light)
                                    
                                    
                                }
                                
                            }
                        }
                    }
                }
                .navigationBarTitle("Reminders")
                .navigationBarItems(
                    trailing:
                        Image(image)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                )
            // }
                .environment(\.horizontalSizeClass, .compact)
        
        
        
    }
}

struct ReminderPage_Previews: PreviewProvider {
    static var previews: some View {
        ReminderPage(color: "Gopher Gold", image: "014-heart").environmentObject(Reminders())
    }
}