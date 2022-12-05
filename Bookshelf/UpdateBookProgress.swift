//
//  UpdateBookProgress.swift
//  Bookshelf
//
//  Created by Kevin Lima on 05/12/2022.
//

import SwiftUI

struct UpdateBookProgress: View {
    @Binding var book: Book
    
    var body: some View {
        Form {
            Section("Progress") {
                TextField("Page number", value: $book.progression, formatter: NumberFormatter())
            }
        }
    }
}

struct UpdateBookProgress_Previews: PreviewProvider {
    struct StatefullWrapper: View {
        @State var testbook = Book.example
        
        var body: some View {
            UpdateBookProgress(book: $testbook)
        }
    }
    
    static var previews: some View {
        StatefullWrapper()
        StatefullWrapper()
            .preferredColorScheme(.dark)
    }
}
