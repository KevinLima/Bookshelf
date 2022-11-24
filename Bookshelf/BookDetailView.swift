//
//  BookDetailView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    
    var body: some View {
        ScrollView (){
            Cover(book: book)
            Header(book: book)
            Controls()
            InfoList(book: book)
            Spacer()
        }
    }
}

struct Cover: View {
    var book: Book
    
    var body: some View {
        HStack(alignment: .center) {
            Image("\(book.coverImage)")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
        }
    }
}

struct Header: View {
    var book: Book
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.headline)
            
            Text(book.author)
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Text("\(book.genre) - \(book.releaseYear)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct Controls: View {
    var body: some View {
        HStack {
            Button("Bookmark") {
            }
            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            .background(Color(red: 4.7, green: 7, blue: 7, opacity: 0.02))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            
            Button("Complete") {
            }
            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            .background(Color(red: 4.7, green: 7, blue: 7, opacity: 0.02))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}

struct InfoList: View {
    var book: Book
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        List {
            Text("Current page: \(book.progression)")
            Text("Pages left: \(book.pagesLeftToRead)")
            Text("Precent compete: \(book.formattedPrecemtComplete)")
            Text("Total pages: \(book.pageCount)")
        }
        .frame(minHeight: minRowHeight * 5)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    struct StatefulWrapper : View {
        @State private var testBook = Book.example
        
        var body: some View {
            BookDetailView(book: $testBook)
        }
    }
    
    static var previews: some View {
        Group{
            NavigationView {
                StatefulWrapper()
            }
            
            NavigationView {
                StatefulWrapper()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
