//
//  FavoritesPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

struct FavoritesPage: View {
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            
            if favorites.duas.isEmpty {
                VStack{
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 100, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                    Text("Add Favorites for quick").fontWeight(.light)
                    Text("and easy access to them right here!").fontWeight(.light)
                    Spacer()
                }.navigationBarTitle("Favorites")
            } else {
                List{
                    ForEach(favorites.duas
                                .sorted{ $0.name < $1.name }) { dua in
                        NavigationLink(
                            destination: DuaView(dua: dua, categoryColor: Color(.blue))) {
                            HStack{
                                Text(dua.name.capitalized)
                                    .foregroundColor(.primary)
                                    .fontWeight(.light)
                                    .lineLimit(2)
                            }
                        }
                    }

                }.navigationBarTitle("Favorites")
            }
        }.environment(\.horizontalSizeClass, .compact)
    }
}

struct FavoritesPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPage().environmentObject(Favorites())
    }
}
