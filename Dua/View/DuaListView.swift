//
//  DuaListView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/30/20.
//

import SwiftUI

struct DuaListView: View {
    var categoryName: String
    var categoryImage: String
    @ObservedObject var duas = DuaViewModel()
    
    var body: some View {
        List(duas.duas.filter {
            $0.category == categoryName
        }){ dua in
            NavigationLink(
                destination: DuaView(dua: dua)){
                HStack{
                    Text(dua.name)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .lineLimit(2)
                }
            }
        }
        .navigationBarTitle(categoryName)
        .navigationBarItems(
            trailing:
                Image(categoryImage)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}

struct DuaListView_Previews: PreviewProvider {
    static var previews: some View {
        DuaListView(categoryName: "Daily", categoryImage: "001-moon")
    }
}
