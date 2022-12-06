//
//  AddBookView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 02/12/2022.
//

import SwiftUI

struct AddBookView: View {
    @Binding var newBook: Book
    
    var body: some View {
        Form {
            Section("Add book") {
                TextField("Book title", text: $newBook.title)
                TextField("Author", text: $newBook.author)
                TextField("Genre", text: $newBook.genre)
                TextField("Release year", value: $newBook.releaseYear, formatter: NumberFormatter())
                TextField("Page count", value: $newBook.pageCount, formatter: NumberFormatter())
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    struct StatefullWrapper: View {
        @State var testBook = Book.example
        
        var body: some View{
            AddBookView(newBook: $testBook)
        }
    }
    
    static var previews: some View {
        StatefullWrapper()
        StatefullWrapper()
            .preferredColorScheme(.dark)
    }
}
