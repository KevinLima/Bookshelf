//
//  BookDataManager.swift
//  Bookshelf
//
//  Created by Kevin Lima on 25/11/2022.
//

import Foundation

struct BookDataManager {
    
    func load(completion: @escaping ([Book]) -> Void){
        DispatchQueue.global(qos: .background).async {
            
            // Copy the books.json file to the user's document folder, if its not already there
            // You should never save files back to the application bundle directory, so make an initial copy
            if FileManager.default.fileExists(atPath: Self.fileURL.path) == false {
                let bundleBooksURL = Bundle.main.url(forResource: "books", withExtension: "json")!
                try! FileManager.default.copyItem(at: bundleBooksURL, to: Self.fileURL)
            }
            
            // Read the users book file that is in the document folder
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            
            // Attempt to decode the JSON document into an array of Books
            let decoder = JSONDecoder()
            
            guard let books = try? decoder.decode([Book].self, from: data) else {
                fatalError("Cannot decode the saved books data")
            }
            
            // Pass the array of the Book back to the caller through the completion handler that its passed in
            DispatchQueue.main.async {
                completion(books)
            }
        }
    }
    
    func save(books: [Book]){
        DispatchQueue.global(qos: .background).async {
            let encoder = JSONEncoder()
            
            // attempt to encode the array of books into a json document
            guard let bookData = try? encoder.encode(books) else {
                fatalError("Error encoding the books data")
            }
            
            do {
                // write the encoded json file to the users documents folder
                let outfile = Self.fileURL
                try bookData.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
    // MARK: Helper functions
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
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
