//
//  BookshelfTests.swift
//  BookshelfTests
//
//  Created by Kevin Lima on 06/12/2022.
//

import XCTest
@testable import Bookshelf

final class BookshelfTests: XCTestCase {
    
    var example = Book(
        bookId: "99",
        title: "Game of Thrones",
        author: "George RR. Marting",
        genre: "Fantasy",
        pageCount: 100,
        progression: 10,
        coverImage: "potter",
        releaseYear: 2001
    )

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(example.pagesLeftToRead, 90)
        XCTAssertEqual(example.percentComplete, 0.1)
        XCTAssertEqual(example.formattedPrecemtComplete, "10%")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
