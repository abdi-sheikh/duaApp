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
    @State var isPressed = false
    @ObservedObject var favorites = Favorites()
        
    var dua: Dua

    var body: some View {
        
        ZStack {
            Image(systemName: "heart.fill")
                // if true or false hide or show filled heart w/ animation
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.easeIn)
            Image(systemName: "heart")
        }.font(.system(size: 20))
        .onAppear {
            // logic to store show heart filled if value in fav array
            print(favorites.contains(dua))
        }
        .onTapGesture {
            // add or remove from userDefaults fav data
            if self.isPressed == false {
                self.isPressed.toggle()
                self.favorites.add(dua)
            } else {
                self.isPressed.toggle()
                self.favorites.remove(dua)
            }
        }
        .foregroundColor(isPressed ? .red : .secondary)
    }
}
