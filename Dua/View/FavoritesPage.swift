//
//  FavoritesPage.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/27/21.
//

import SwiftUI

struct FavoritesPage: View {
    var body: some View {
        VStack() {
            HStack {
                Text("Favorites")
                    .font(.largeTitle)
                    .fontWeight(.regular)
            }
            Text("Coming Soon")

        }.padding([.top, .leading, .trailing])
    }
}

struct FavoritesPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPage()
    }
}
