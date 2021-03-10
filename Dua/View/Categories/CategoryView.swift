//
//  CategoryView.swift
//  Dua
//
//  Created by Abdi Sheikh on 12/29/20.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.colorScheme) private var colorScheme
    var columns = Array(repeating: GridItem(.adaptive(minimum: 159)), count: 2)
    var category_Data: [Category]
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(category_Data) { cate in
                NavigationLink(
                    destination: DuaListView(categoryName: cate.name, categoryImage: cate.image, categoryColor: cate.color)) {
                    LazyVStack(spacing: 20) {
                        Image(cate.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 63, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(cate.name)
                            .font(.system(size: 24))
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                            .fontWeight(.thin)
                            .minimumScaleFactor(0.01)
                            .lineLimit(0)
                    }
                    .padding(.all, 20.0)
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(cate.color)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 157, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: colorScheme == .dark ? Color(.sRGBLinear, white: 100, opacity: 0.2) : Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 5)
                    )
                }.foregroundColor(.black)
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 25)
        .padding(.bottom, 20)
    }
}

