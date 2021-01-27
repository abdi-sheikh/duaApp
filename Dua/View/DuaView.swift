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
                }

                
                VStack{
                    VStack(alignment: .leading){
                        Text("Translation")
                            .font(.caption)
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
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
                
                LikeShareButton(dua: dua)
            }.padding([.leading, .bottom, .trailing], 20.0)
            .navigationBarItems(trailing: Image(systemName: "square.and.arrow.up"))
        }
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .center, endPoint: .bottom))
    }
}


struct DuaView_Previews: PreviewProvider {
    static var previews: some View {
        DuaView(dua: Dua.init(id: "abc123", name: "Waking up", arabicDua: "الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ", translation: "All praise is for Allah who gave us life after causing us to die, and unto Him is the resurrection. (Bukhari)", transliteration: "alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor", category: "daily"))
    }
}
