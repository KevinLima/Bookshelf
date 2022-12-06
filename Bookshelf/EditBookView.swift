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
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                TextField("Author", text: $book.author)
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                TextField("Genre", text: $book.genre)
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                TextField("Release year", value: $book.releaseYear, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                TextField("Page count", value: $book.pageCount, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
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
