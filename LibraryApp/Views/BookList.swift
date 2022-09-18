//
//  BookList.swift
//  LibraryApp
//
//  Created by Tobiloba on 15/09/2022.
//

import SwiftUI

struct BookList: View {
    @EnvironmentObject var model:ViewModel
   
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink(destination: Staging(book: book)) {
                            BookPreview(book: book).padding([.leading, .trailing], 20)
                        }
                       
                    NavigationLink(destination: EmptyView()) {
                        EmptyView()
                    }
                    }
                   
            }
                .padding(.top)
        }
            .navigationTitle("My Library")
       
    }
        
}
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList().environmentObject(ViewModel())
    }
}
