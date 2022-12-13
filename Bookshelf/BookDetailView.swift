//
//  BookDetailView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @State private var showEdit = false
    @State private var bookForEdititng = Book()
    
    var body: some View {
        ScrollView (){
            Cover(book: book)
            Header(book: book)
            ProgressUpdate(book: $book)
            InfoList(book: book)
            Spacer()
        }
        .navigationBarItems(
            trailing: Button(action: {
                bookForEdititng = book
                showEdit = true
            }, label: {
                Text("Edit")
            })
        )
        .sheet(isPresented: $showEdit) {
            NavigationView {
                EditBookView(book: $bookForEdititng)
                    .navigationBarItems(leading: Button(action: {
                        showEdit = false
                    }, label: {
                        Text("Cancel")
                    }), trailing: Button(action: {
                        showEdit = false
                        self.book = bookForEdititng
                    }, label: {
                        Text("Done")
                    }))
            }
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
            
            let release = String(book.releaseYear) // to prevent comma in the number
            Text("\(book.genre) - \(release)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct ProgressUpdate: View {
    @State private var showUpdate = false
    @Binding var book: Book
    @State var bookForUpdating = Book()
    
    var body: some View {
        HStack {
            Button(action: {
                bookForUpdating = book
                showUpdate = true
            }, label: {
                Text("Update progress")
            })
            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            .background(Color(red: 4.7, green: 7, blue: 7, opacity: 0.02))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .sheet(isPresented: $showUpdate) {
                NavigationView {
                    UpdateBookProgress(book: $bookForUpdating)
                        .navigationBarItems(leading: Button(action: {
                            showUpdate = false
                        }, label: {
                            Text("Cancel")
                        }), trailing: Button(action: {
                            book = bookForUpdating
                            showUpdate = false
                        }, label: {
                            Text("Done")
                        }))
                }
            }
        }
    }
}

struct InfoList: View {
    var book: Book
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        List {
            PercentProgressRow(
                displayName: "Progress",
                formattedValue: book.formattedPrecemtComplete,
                metricName: "Completed"
            )
            PagesProgressRow(
                value: book.progression,
                total: book.pageCount,
                displayName: "Progress",
                metricName: "Pages"
            )
            LastTimeReadRow(value: "12 October 2022", displayName: "Last time read")
        }
        .frame(minHeight: minRowHeight * 6)
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
