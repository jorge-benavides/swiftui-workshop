//
//  BookRepositoy.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import Foundation

class BookRepository {
    var books: [Book] = []

    init() {
        self.reload()
    }

    func reload() {
        self.books = Self.mock
    }
}

extension BookRepository {
    static var mock: [Book] {
        var books: [Book] = []
        let count = Int.random(in: 3...6)

        (0...count).forEach { n in
            books.append(Book.mock)
        }
        return books
    }
}
