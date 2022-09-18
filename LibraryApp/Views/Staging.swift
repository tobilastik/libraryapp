//
//  Staging.swift
//  LibraryApp
//
//  Created by Tobiloba on 15/09/2022.
//

import SwiftUI

struct Staging: View {
    
    @EnvironmentObject var model:ViewModel
    let rating = ["1", "2", "3", "4", "5"]
    @State var ratingIndex = 1
   
    var book: Book
   
    var body: some View {
        VStack {
            VStack {
                Text(book.title)
                Text("Read Now!")
            }
            Spacer()
            NavigationLink(destination: BookContent(book:book)) {
            Image("cover\(book.id)").resizable().scaledToFit()
            }
            
            Spacer()
            VStack {
                Text("Mark for later")
                Button(action: {
                    model.updateFavourite(forId: book.id)
                }) {
                    Image(systemName: book.isFavourite ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .frame(width: 28, height: 28)
                }
            }
            Spacer()
            
            VStack {
                Text("Rate \(book.title)")
                Picker("Rate", selection: $ratingIndex) {
                    ForEach(1..<6) { index in
                        Text("\(index)").tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: ratingIndex, perform: {
                    value in model.updateRating(forId: book.id, rating: ratingIndex)
                })
            }
        }
        .onAppear {
            ratingIndex = book.rating
        }
        .navigationTitle("\(book.title)")
    }
}

struct Staging_Previews: PreviewProvider {
    static var previews: some View {
        Staging(book: Book()).environmentObject(ViewModel())
    }
}
