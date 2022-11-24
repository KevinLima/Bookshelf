//
//  BookRow.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookRow: View {
    @Binding var book: Book
    
    var body: some View {
        VStack {
            HStack {
                Image(book.coverImage)
                    .resizable()
                    .frame(width: 75, height: 110)
                    .aspectRatio(contentMode: .fill)
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Spacer()
                    VStack (alignment: .leading) {
                        Label(book.author, systemImage: "person.fill")
                        Label("\(book.formattedPrecemtComplete) complete", systemImage: "percent")
                        Label("\(book.pagesLeftToRead) pages left to read", systemImage: "book")
                    }
                    .font(.callout)
                    .foregroundColor(.accentColor)
                    
                }
                .frame(height: 110)
                Spacer()
            }
        }.padding(.trailing)
    }
}

struct BookRow_Previews: PreviewProvider {
    struct StateFullWrapper: View {
        @State private var testBook = Book.example
        
        var body: some View {
            BookRow(book: $testBook)
        }
    }
    
    static var previews: some View {
        StateFullWrapper()
        StateFullWrapper().preferredColorScheme(.dark)
    }
}
