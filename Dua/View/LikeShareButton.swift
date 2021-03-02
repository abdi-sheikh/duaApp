//
//  LikeShareButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import PartialSheet
import SwiftUI

struct LikeShareButton: View {
    var dua: Dua
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        HStack{
            Button(action: {
                self.partialSheetManager.showPartialSheet({
                    print("Partial sheet dismissed")
                }) {
                     ReminderButton()
                }
            }, label: {
                Text("Show sheet")
            })
            Image(systemName: "deskclock")
            HStack {
                Divider()
            }.frame( height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            LikeButton(dua: dua)
        }
        .foregroundColor(.gray)
        .padding()
        .overlay(
            Capsule(style: .continuous)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
        )
    }
}


struct LikeButton : View {
    var dua: Dua
    
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    @ObservedObject var favorites = Favorites()
    
    @State var isPressed = false
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.easeIn)
            Image(systemName: "heart")
        }.font(.system(size: 20))
        .onAppear {
            favorites.contains(dua) ? isPressed == true : isPressed == false
            print(favorites.contains(dua))
        }
        .onTapGesture {
            if self.isPressed == false {
                self.isPressed.toggle()
                self.favorites.add(dua)
            } else {
                self.isPressed.toggle()
                self.favorites.remove(dua)
            }
        }
        .foregroundColor(isPressed ? .red : .gray)
    }
}

struct LikeShareButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeShareButton(dua: Dua.init(id: "abc123", name: "Waking up", arabicDua: "الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ", translation: "All praise is for Allah who gave us life after causing us to die, and unto Him is the resurrection. (Bukhari)", transliteration: "alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor", category: "daily"))
    }
}
