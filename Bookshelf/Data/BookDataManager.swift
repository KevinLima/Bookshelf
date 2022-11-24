//
//  BookDataManager.swift
//  Bookshelf
//
//  Created by Kevin Lima on 24/11/2022.
//

import Foundation

struct BookDataManager: Codable {
    
    func load(completion: @escaping ([Book]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            
            // Copy the book.json file to the user's documents folder, if its not already there
            // You should never save files back to the application bundle directory, so make an initial copy
            
            if FileManager.default.fileExists(atPath: Self.fileURL.path) == false {
                let bundleProjectsURL = Bundle.main.url(forResource: "books", withExtension: "json")!
                try! FileManager.default.copyItem(at: bundleProjectsURL, to: Self.fileURL)
            }
            
            // Read the users book json file that is in the documents folder
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            
            let decoder = JSONDecoder()
            
            // Attempt to decode the JSON document into an array of Book
            guard let books = try? decoder.decode([Book].self, from: data) else {
                fatalError("Can't decode saved books data")
            }
            
            // Pass the array of books back to the caller
            DispatchQueue.main.async {
                completion(books)
            }
            
        }
    }
    
    // MARK: Helper functions
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("books.json")
    }
}
