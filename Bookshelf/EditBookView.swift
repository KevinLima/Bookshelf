//
//  EditBookView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 30/11/2022.
//

import SwiftUI

struct EditBookView: View {
    @Binding var book: Book
    
    var body: some View {
        Form {
            Section("Edit book") {
                TextField("Book title", text: $book.title)
                TextField("Author", text: $book.author)
                TextField("Genre", text: $book.genre)
                TextField("Release year", value: $book.releaseYear, formatter: NumberFormatter())
                TextField("Page count", value: $book.pageCount, formatter: NumberFormatter())
            }
        }
    }
}

struct EditBookView_Previews: PreviewProvider {
    struct StatefullWrapper: View{
        @State var testBook = Book.example
        
        var body: some View{
            EditBookView(book: $testBook)
        }
    }
    
    static var previews: some View {
        StatefullWrapper()
        StatefullWrapper()
            .preferredColorScheme(.dark)
    }
}
