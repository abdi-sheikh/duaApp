//
//  ReminderButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct ReminderButton: View {
    @State private var timeSelection = Date()
    @State var repeatSelection: String = "Weekly"
    @State var daysSelection =  Set<String>()
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    let days = ["Sun","Mon","Tues","Wed","Thur","Fri","Sat"]
    let array = ["Daily", "Weekly", "Bi-weekly", "Monthly"]
    var body: some View {
            VStack {
                
                // Days
                HStack {
                    Button(action: {
                    }) {
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                // setup for this is a mess but it is because we want to make it work on all screens
                                .fontWeight(.light)
                                .minimumScaleFactor(0.01)
                                .lineLimit(1)
                                .frame(maxWidth: 125, minHeight: 45)
                                .background(daysSelection.contains(day) ? Color.blue : Color.clear)
                                .foregroundColor(daysSelection.contains(day) ? Color.white : Color.blue)
                                .clipShape(
                                    Circle()
                                )
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 1)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        // add or remove to value that will be saved
                                        if daysSelection.contains(day) {
                                            daysSelection.remove(day)
                                        } else {
                                            daysSelection.insert(day)
                                        }
                                    }
                                }
                        }
                    }
                }.padding(.horizontal)
                
                // Time - Date picker
                DatePicker("Please enter a time", selection: $timeSelection, displayedComponents: .hourAndMinute)
                    .padding(.horizontal)
                
                // Repeat
                HStack(alignment: .center) {
                    Text("Repeat")
                    Spacer()
                    Picker(repeatSelection, selection: $repeatSelection) {
                        ForEach(array, id: \.self) { day in
                            Text(day).tag(day)
                        }
                    }
                    .frame(width: 95, height: 35)
                    .pickerStyle(MenuPickerStyle())
                    .background(
                        Color(.lightGray)
                            .opacity(0.2)
                    )
                    .cornerRadius(5)
                }.padding(.horizontal)
                
                // Save Button
                Button(action: {
                    withAnimation {
                        print("\(daysSelection) \(timeSelection) \(repeatSelection)")
                        partialSheetManager.closePartialSheet()
                    }
                }) {
                    Text("Save")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                }
            }
    }
}

struct ReminderButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReminderButton()
        }
    }
}
