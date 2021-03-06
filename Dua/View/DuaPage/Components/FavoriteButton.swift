//
//  LikeShareButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct FavoriteButton : View {
    @EnvironmentObject private var favorites: Favorites
    var duaId: String

    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(opacity)
                .scaleEffect(scaleEffect)
                .animation(.easeIn)
            Image(systemName: "heart")
        }.font(.system(size: 20))
        .onTapGesture(perform: toggleHeart)
        .foregroundColor(foregroundColor)
    }
}

private extension FavoriteButton {
    var isFavorited: Bool {
        favorites.ids.contains(duaId)
    }
    
    var opacity: Double {
        isFavorited ? 1 : 0
    }
    
    var scaleEffect: CGFloat {
        isFavorited ? 1.0 : 0.1
    }
    
    var foregroundColor: Color {
        isFavorited ? .red : .secondary
    }
    
    func toggleHeart() {
        if isFavorited == false {
            self.favorites.add(duaId)
        } else {
            self.favorites.remove(duaId)
        }
    }
}
