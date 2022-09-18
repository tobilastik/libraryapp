//
//  BookPreview.swift
//  LibraryApp
//
//  Created by Tobiloba on 15/09/2022.
//

import SwiftUI

struct BookPreview: View {
     var book: Book
   
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle().foregroundColor(.white).cornerRadius(12).shadow(color: .gray, radius: 5, x: -5, y: 5)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(book.title).bold().font(.largeTitle)
                    
                    if book.isFavourite {
                        Image(systemName: book.isFavourite ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .frame(width: 35, height: 35)
                    }
                }
                Text(book.author).italic()
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            
            }.padding()
        }
        .accentColor(.black)
        }
    }



struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: Book())
    }
}
