//
//  SettingsPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                print("Hello button tapped!")
            }) {
                Text("Write a Review ")
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 1)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    
            }
            
            Button(action: {
                print("Hello button tapped!")
            }) {
                Text("Tell a Friend")
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 1)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    
            }

            Button(action: {
                print("Hello button tapped!")
            }) {
                Text("Send Feedback!")
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 1)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    
            }
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
