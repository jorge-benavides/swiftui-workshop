//
//  BookListItemViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import Foundation

public struct BookListItemViewModel {
    private let book: Book
    
    public init(book: Book) {
        self.book = book
    }
    public var cover: String {
        book.cover
    }
    public var author: String {
        "By \(book.author)"
    }
    public var title: String {
        book.title
    }
    public var price: String {
        "$\(String(format: "%.2f", book.price))"
    }
}
