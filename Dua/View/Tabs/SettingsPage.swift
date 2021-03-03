//
//  SettingsPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

struct SettingsPage: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("For more info check out website")
            Button("DuaReminder.app") {
                openURL(URL(string: "https://www.duareminder.app")!)
            }
            .foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            )
            Spacer()
            Text("Version 1.0")
        }.padding(25)
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
