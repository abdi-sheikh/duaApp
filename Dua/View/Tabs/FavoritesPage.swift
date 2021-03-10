//
//  FavoritesPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

// MARK: - FavoritesPage

struct FavoritesPage: View {
    @EnvironmentObject private var favorites: Favorites
    @EnvironmentObject private var duaViewModel: DuaViewModel
    
    var color: String
    var image: String
    
    var body: some View {
        (favorites.ids.isEmpty ? fallbackView.any : favoritesListView.any)
        .navigationTitle("Favorites")
        .navigationBarItems(
            trailing:
                Image(image)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}

// MARK: - Helper views

private extension FavoritesPage {
    var fallbackView: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: "heart")
                .resizable()
                .frame(width: 100, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            Text(String.fallbackTitle)
                .fontWeight(.light)
                .padding(.horizontal, 44)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
    
    var favoritesListView: some View {
        List{
            ForEach(favorites.ids.compactMap(duaViewModel.duaById)) { dua in
                NavigationLink(
                    destination: DuaView(dua: dua, categoryColor: Color(color))) {
                    HStack{
                        Text(dua.name.capitalized)
                            .foregroundColor(.primary)
                            .fontWeight(.light)
                            .lineLimit(2)
                    }
                }
            }
        }
        .navigationBarItems(
            trailing:
                Image(image)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
        
    }
}

// MARK: - String constatns

fileprivate extension String {
    static let fallbackTitle = "Add favorites for quick and easy access to them right here!"
}
