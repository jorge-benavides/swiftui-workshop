//
//  BookDetailViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

class BookDetailViewModel: ObservableObject {

    @Published public var book: Book
    private let repository: BookRepository

    public init(book: Book, repository: BookRepository) {
        self.book = book
        self.repository = repository
    }
    public func reload() {
        repository.getBook(id: book.id, completion: { book in
            guard let book = book else { return }
            self.book = book
        })
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
    var cover: String {
        book.cover
    }
    var stock: Int {
        book.stock
    }
    var tags: [String] {
        book.tags
    }
    var buyButton: String {
        "Buy for \(String(format: "%.2f", book.price))$"
    }
}
