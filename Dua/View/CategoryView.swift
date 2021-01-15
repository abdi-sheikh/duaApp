//
//  CategoryView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import SwiftUI

struct CategoryView: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var category_Data: [Category]
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(category_Data) { cate in
                    NavigationLink(
                        destination: DuaListView(categoryName: cate.name, categoryImage: cate.image)) {
                        LazyVStack(spacing: 20) {
                            Image(cate.image)
                                .resizable()
                                .frame(width: 63, height: 63, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text(cate.name)
                                .font(.system(size: 24))
                                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                .fontWeight(.thin)
                                .lineLimit(0)
                        }
                        .padding(.all, 20.0)
                        .background(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(cate.color)
                                .frame(width: 157, height: 157, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        )
                    }.foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.top, 25)
        }

    }
}

