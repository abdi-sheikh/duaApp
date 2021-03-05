//
//  MainCategoriesView.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/4/21.
//

import SwiftUI

struct MainCategoriesView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var favorites = Favorites()
    @StateObject var reminders = Reminders()
    
    
    var body: some View {
        VStack{
            NavigationLink(destination: ReminderPage()) {
                VStack {
                        HStack {
                            VStack(alignment: .leading){
                                Text("Reminders")
                                    .font(.system(size: 24))
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(0)
                                    .foregroundColor(.black)
                                if reminders.reminders.count != 1 {
                                    Text ("\(reminders.reminders.count) reminders")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                    } else {
                                    Text("\(reminders.reminders.count) reminder")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                            Image("reminder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 43, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        }.padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color("Reminder Fire"))
                            .shadow(color: colorScheme == .dark ? Color(.sRGBLinear, white: 100, opacity: 0.2) : Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 5)
                    )
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
            }

            NavigationLink(destination: FavoritesPage()) {
                VStack {
                        HStack {
                            VStack(alignment: .leading){
                                Text("Favorites")
                                    .font(.system(size: 24))
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(0)
                                    .foregroundColor(.black)
                                if favorites.duas.count != 1 {
                                    Text("\(favorites.duas.count) favorites")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                    
                                } else {
                                    Text("\(favorites.duas.count) favorite")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                            Image("014-heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 43, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        }.padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color("Gopher Gold"))
                            .shadow(color: colorScheme == .dark ? Color(.sRGBLinear, white: 100, opacity: 0.2) : Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 5)
                    )
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
            }
        }

    }
}

struct MainCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MainCategoriesView()
    }
}


