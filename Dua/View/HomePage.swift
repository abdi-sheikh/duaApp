//
//  HomePage.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import SwiftUI

struct HomePage: View {
    
    let allCategories: [Category] = [
        Category(id: 0, image: "014-heart", name: "Favorites", color: Color("Gopher Gold")),
        Category(id: 1, image: "001-moon", name: "Daily", color: Color("Cadet Blue")),
        Category(id: 2, image: "002-quran", name: "Quranic", color: Color("Dim Gray")),
        Category(id: 3, image: "003-climate", name: "Weather", color: Color("Indy Red")),
        Category(id: 4, image: "004-money", name: "Rizq", color: Color("Light slate gray")),
        Category(id: 5, image: "005-shield", name: "Protection", color: Color("Olive Green")),
        Category(id: 6, image: "006-islam", name: "Prayer", color: Color("Pale Turquoise")),
        Category(id: 7, image: "007-plane", name: "Travel", color: Color("Rosy Brown")),
        Category(id: 8, image: "008-doctor", name: "Health", color: Color("Sea Green")),
        Category(id: 9, image: "009-wedding", name: "Marriage", color: Color("Sienna")),
        Category(id: 10, image: "010-moon-1", name: "Ramadan", color: Color("Soft Gray")),
        Category(id: 11, image: "011-mecca", name: "Hajj", color: Color("Soft Pink")),
        Category(id: 12, image: "012-hug", name: "Comfort", color: Color("SPink")),
        Category(id: 13, image: "013-add", name: "See More", color: Color("Steel Blue")),
    ]
    
    var body: some View {
        NavigationView{
            CategoryView(category_Data: allCategories)
                .navigationBarTitle("Dua Reminder")
                .navigationBarTitleDisplayMode(.large)
        }.foregroundColor(.gray)
    }
}



