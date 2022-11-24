//
//  BookshelfApp.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

@main
struct BookshelfApp: App {
    private var bookDataManager = BookDataManager()
    @State private var books =  Book.testData
    
    var body: some Scene {
        WindowGroup {
            BookshelfView(books: $books)
                .onAppear{
                    bookDataManager.load(completion: { books in
                        self.books = books
                    })
                }
        }
    }
}
