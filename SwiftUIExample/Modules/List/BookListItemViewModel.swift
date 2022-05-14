//
//  BookListItemViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import Foundation

struct BookListItemViewModel {
    private let book: Book
    
    public init(book: Book) {
        self.book = book
    }
    var cover: String {
        book.cover
    }
    var author: String {
        "By \(book.author)"
    }
    var title: String {
        book.title
    }
    var price: String {
        "$\(String(format: "%.2f", book.price))"
    }
}
