//
//  ContentView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookshelfView: View {
    @Binding var books: [Book]
    @State var showAddNew = false
    @State var newBook: Book = Book()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    let bookIndex = books.firstIndex(where: {$0.bookId == book.bookId})!
                    let bookBinding = $books[bookIndex]
                    
                    NavigationLink (
                        destination: BookDetailView(book: bookBinding),
                        label: { BookRow(book: bookBinding) }
                    )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Bookshelf")
            .navigationBarItems(trailing: Button(action: {
                showAddNew = true
            }, label: {
                Text("Add")
            }))
            .sheet(isPresented: $showAddNew) {
                NavigationView {
                    AddBookView(newBook: $newBook)
                        .navigationBarItems(leading: Button(action: {
                            newBook = Book()
                            showAddNew = false
                        }, label: {
                            Text("Cancel")
                        }), trailing: Button(action: {
                            showAddNew = false
                            self.books.append(newBook)
                            newBook = Book()
                        }, label: {
                            Text("Done")
                        }))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct StatefullWrapper: View {
        @State private var testBooks = Book.testData
        @State private var testBook = Book.example
        
        var body: some View {
            BookshelfView(books: $testBooks, newBook: testBook)
        }
    }
    
    static var previews: some View {
        Group {
            NavigationView {
                StatefullWrapper()
            }
            NavigationView {
                StatefullWrapper()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
