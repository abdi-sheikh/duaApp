//
//  FavoritesPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

struct FavoritesPage: View {
    @ObservedObject var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            List(favorites.getDuaIds()
                    .sorted{ $0.name < $1.name }
            ){ dua in
                NavigationLink(
                    destination: DuaView(dua: dua, categoryColor: Color(.blue))){
                    HStack{
                        Text(dua.name.capitalized)
                            .foregroundColor(.primary)
                            .fontWeight(.light)
                            .lineLimit(2)
                    }
                }
            }
            .navigationBarTitle("Favorites")
        }
    }
}

struct FavoritesPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPage()
    }
}
