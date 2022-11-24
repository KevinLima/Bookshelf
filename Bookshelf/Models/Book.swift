//
//  Book.swift
//  Bookshelf
//
//  Created by Kevin Lima on 20/11/2022.
//

import Foundation
import SwiftUI

struct Book: Codable {
    var ISDN: Int
    var title: String
    var author: String
    var genre: String
    var pageCount: Int
    var progression: Int
    var coverImage: String
    var releaseYear: String
}
