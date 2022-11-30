//
//  Book.swift
//  Bookshelf
//
//  Created by Kevin Lima on 20/11/2022.
//

import Foundation
import SwiftUI

struct Book: Codable {
    var ISDN: Int = 0
    var title: String = ""
    var author: String = ""
    var genre: String = ""
    var pageCount: Int = 0
    var progression: Int = 0
    var coverImage: String = ""
    var releaseYear: Int = 0
}
