//
//  BookDetailViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

struct BookDetailViewModel {
    private let book: Book
    public init(book: Book) {
        self.book = book
    }
    var author: String {
        book.author
    }
    var title: String {
        book.title
    }
    var description: String {
        book.description
    }
    var poster: String {
        book.poster
    }
    var tags: [String] {
        book.tags
    }
    var buyButton: String {
        "Buy for \(book.price)"
    }
}
