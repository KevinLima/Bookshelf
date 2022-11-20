//
//  ContentView.swift
//  Bookshelf
//
//  Created by Kevin Lima on 15/10/2022.
//

import SwiftUI

struct BookshelfView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink (
                    destination: BookDetailView(book: .example),
                    label: { BookRow(book: Book.example) }
                )
            }
            .listStyle(.plain)
            .navigationTitle("Bookshelf")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}
