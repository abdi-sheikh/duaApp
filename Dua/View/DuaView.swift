//
//  DuaView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/31/20.
//

import Firebase
import SwiftUI

struct DuaView: View {
    var dua: Dua
    
    var body: some View {
        
        ScrollView(){
            VStack(spacing: 40){
                Text(dua.name)
                    .fontWeight(.light)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.black)
                
                VStack {
                    Text(dua.arabicDua)
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.black)
                        
                    LikeButton(dua: dua).frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
                    
                }

                
                VStack{
                    VStack(alignment: .leading){
                        Text("Translation")
                            .font(.caption)
                        Divider()
                    }.padding(.horizontal, 20.0)
                    
                    Text(dua.translation)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .font(.title3)
                        .lineSpacing(10.0)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.black)
                }
                .padding(.top, -10.0)
                
                VStack{
                    VStack(alignment: .leading){
                        Text("Transliteration")
                            .font(.caption)
                        Divider()
                    }.padding(.horizontal, 20.0)
                    
                    Text(dua.transliteration)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .font(.title3)
                        .lineSpacing(10.0)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.black)
                    
                }
            }.padding([.leading, .bottom, .trailing], 20.0)
            //.padding(.top, 60.0)
            .navigationBarItems(trailing: Image(systemName: "square.and.arrow.up"))
        }
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

struct DuaView_Previews: PreviewProvider {
    static var previews: some View {
        DuaView(dua: Dua.init(id: "abc123", name: "Waking up", arabicDua: "الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ", translation: "All praise is for Allah who gave us life after causing us to die, and unto Him is the resurrection. (Bukhari)", transliteration: "alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor", category: "daily"))
    }
}
