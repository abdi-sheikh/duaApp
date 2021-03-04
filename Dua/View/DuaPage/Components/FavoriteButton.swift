//
//  LikeShareButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct FavoriteButton : View {
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    @EnvironmentObject var favorites: Favorites
        
    var dua: Dua

    var body: some View {
        
        ZStack {
            Image(systemName: "heart.fill")
                // if true or false hide or show filled heart w/ animation
                .opacity(favorites.contains(dua) ? 1 : 0)
                .scaleEffect(favorites.contains(dua) ? 1.0 : 0.1)
                .animation(.easeIn)
            Image(systemName: "heart")
        }.font(.system(size: 20))
        .onTapGesture {
            // add or remove from userDefaults fav data
            if favorites.contains(dua) == false {
                self.favorites.add(dua)
            } else {
                self.favorites.remove(dua)
            }
        }
        .foregroundColor(favorites.contains(dua) ? .red : .secondary)
    }
}
