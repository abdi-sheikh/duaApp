//
//  DuaView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/31/20.
//

import SwiftUI

struct DuaView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var dua: Dua
    var categoryColor: Color
    var body: some View {
        
        ScrollView(){
            VStack(spacing: 40){
                // Name
                Text(dua.name)
                    .fontWeight(.light)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.8)
                    .foregroundColor(.primary)
                
                // Arabic
                VStack {
                    Text(dua.arabicDua)
                        .fontWeight(.light)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.primary)
                }

                // Translation
                VStack{
                    VStack(alignment: .leading){
                        Text("Translation")
                            .font(.caption)
                            .foregroundColor(.primary)
                        Divider()
                    }.padding(.horizontal, 20.0)
                    
                    Text(dua.translation)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .lineSpacing(10.0)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.primary)
                }
                .frame(minWidth: 300.0)
                .padding(.top, -10.0)
                
                // Transliteration
                VStack{
                    VStack(alignment: .leading){
                        Text("Transliteration")
                            .font(.caption)
                            .foregroundColor(.primary)
                        Divider()
                    }.padding(.horizontal, 20.0)
                    
                    Text(dua.transliteration)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .lineSpacing(10.0)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.primary)
                    
                }
                .frame(minWidth: 300.0)
                
                // Reminder + Favorites Capsule
                HStack{
                    //Reminder Button
                    ReminderButton(dua: dua)
                    
                    //Divider
                    HStack {
                        Divider()
                    }
                    .frame( height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.secondary)
                    
                    // Fav Button
                    FavoriteButton(dua: dua)
                }
                .foregroundColor(.secondary)
                .padding()
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.secondary, style: StrokeStyle(lineWidth: 1))
                        
                )
            // padding for VStack
            }.padding([.leading, .bottom, .trailing], 20.0)

        } // attributes for scroll view
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? [.black, categoryColor] : [.white, categoryColor] ), startPoint: .center, endPoint: .bottom))
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct DuaView_Previews: PreviewProvider {
    static var previews: some View {
        DuaView(dua: Dua.init(id: "abc123", name: "Waking up", arabicDua: "الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ", translation: "All praise is for Allah who gave us life after causing us to die, and unto Him is the resurrection. (Bukhari)", transliteration: "alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor", category: "daily"), categoryColor: Color(.yellow))
    }
}
