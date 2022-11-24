//
//  ContentView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookshelfView: View {
    @Binding var books: [Book]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    let bookIndex = books.firstIndex(where: {$0.id == book.id})!
                    let bookBinding = $books[bookIndex]
                    
                    NavigationLink (
                        destination: BookDetailView(book: bookBinding),
                        label: { BookRow(book: bookBinding) }
                    )
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Bookshelf")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct StatefullWrapper: View {
        @State private var testBooks = Book.testData
        
        var body: some View {
            BookshelfView(books: $testBooks)
        }
    }
    
    static var previews: some View {
        StatefullWrapper()
        StatefullWrapper().preferredColorScheme(.dark)
    }
}
