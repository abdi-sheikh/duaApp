//
//  MainCategoriesView.swift
//  Dua
//
//  Created by Abdi Sheikh on 3/4/21.
//

import SwiftUI

struct MainCategoriesView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var favorites : Favorites
    @EnvironmentObject var reminders : Reminders
    var color1 = "Reminder Fire"
    var image1 = "reminder"
    var color2 = "Gopher Gold"
    var image2 = "014-heart"
    
    var body: some View {
        VStack{
            NavigationLink(destination: ReminderPage(color: color1, image: image1)) {
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
                            Image(image1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 43, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                        }.padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, minHeight: 75)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(color1))
                            .shadow(color: colorScheme == .dark ? Color(.sRGBLinear, white: 100, opacity: 0.2) : Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 5)
                    )
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
            }.environmentObject(reminders)

            NavigationLink(destination: FavoritesPage(color: color2, image: image2)) {
                VStack {
                        HStack {
                            VStack(alignment: .leading){
                                Text("Favorites")
                                    .font(.system(size: 24))
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(0)
                                    .foregroundColor(.black)
                                if favorites.ids.count != 1 {
                                    Text("\(favorites.ids.count) favorites")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                    
                                } else {
                                    Text("\(favorites.ids.count) favorite")
                                        .font(.footnote)
                                        .fontWeight(.thin)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(0)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                            Image(image2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 43, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        }.padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, minHeight: 75)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(color2))
                            .shadow(color: colorScheme == .dark ? Color(.sRGBLinear, white: 100, opacity: 0.2) : Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 5)
                    )
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
            }.environmentObject(favorites)
        }

    }
}

struct MainCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MainCategoriesView()
    }
}


