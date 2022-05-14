//
//  BookRepositoy.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import Foundation

class BookRepository: ObservableObject {

    private var catalog: [Book] = [
        Mocks.fellow,
        Mocks.towers,
        Mocks.homo,
        Mocks.fourhours,
        Mocks.man
    ]

    public func getBooks(completion: @escaping ([Book]) -> Void) {
        // fake loading time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.catalog)
        }
    }

    public func getBook(id: String, completion: @escaping (Book?) -> Void) {
        // fake loading time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(self.catalog.first(where: { $0.id == id }))
        }
    }

    public func update(book: Book) {
        guard let index = catalog.firstIndex(where: { $0.id == book.id }) else { return }
        catalog[index] = book
    }
}
