//
//  Book.swift
//  Bookshelf
//
//  Created by Kevin Lima on 20/11/2022.
//

import Foundation
import SwiftUI

struct Book: Codable {
    var bookId: String = UUID().uuidString
    var title: String = ""
    var author: String = ""
    var genre: String = ""
    var pageCount: Int = 10
    var progression: Int = 1
    var coverImage: String = "default"
    var releaseYear: Int = 1900
}
