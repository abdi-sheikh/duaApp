//
//  LikeShareButton.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/26/21.
//

import Firebase
import SwiftUI

struct LikeShareButton: View {
    var dua: Dua
    
    var body: some View {
        HStack{
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

    @State var isPressed = false
    var body: some View {
        let db = Firestore.firestore()
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.easeIn)
            Image(systemName: "heart")
        }.font(.system(size: 20))
            .onTapGesture {
                if self.isPressed == false {
                    self.isPressed.toggle()
                    db.collection("favorites").document(dua.name).setData(
                        [
                            "arabic_dua" : dua.arabicDua,
                            "category" : dua.category,
                            "name" : dua.name,
                            "translation" : dua.translation,
                            "transliteration" : dua.transliteration
                        ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                } else {
                    self.isPressed.toggle()
                    db.collection("favorites").document(dua.name).delete() {err in
                        if let err = err {
                            print("Error removing document: \(err)")
                        } else {
                            print("Document successfully removed!")
                        }
                    }
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
