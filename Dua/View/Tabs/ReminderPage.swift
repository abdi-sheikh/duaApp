//
//  ReminderPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/21/21.
//

import SwiftUI

struct ReminderPage: View {
    
    var body: some View {
        VStack() {
            HStack {
                Text("Reminders")
                    .font(.largeTitle)
                    .fontWeight(.regular)
            }
            Text("Coming Soon")

        }.padding([.top, .leading, .trailing])
    }
    
}

struct ReminderPage_Previews: PreviewProvider {
    static var previews: some View {
        ReminderPage()
    }
}
