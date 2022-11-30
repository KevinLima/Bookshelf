//
//  Book + SwiftUI.swift
//  Bookshelf
//
//  Created by Kevin Lima on 20/11/2022.
//

import Foundation
import SwiftUI

extension Book {
    var pagesLeftToRead: Int {
        if (progression > pageCount){
            return pageCount
        }
        
        if (progression < 0){
            return 0
        }
        
        return pageCount - progression
    }
    
    var percentComplete: Double {
        return Double(progression) / Double(pageCount)
    }
    
    var formattedPrecemtComplete: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        
        return formatter.string(from: NSNumber(value: percentComplete)) ?? "0%"
    }
    
    static var example = Book(
        ISDN: 1233,
        title: "Harry Potter and the Philosopher's Stone",
        author: "J.K. Rowling",
        genre: "Fantasy",
        pageCount: 223,
        progression: 122,
        coverImage: "potter",
        releaseYear: 2001
    )
    
    static var testData = [example]
}

extension Book: Identifiable {
    var id: Int {
        self.ISDN
    }
}
