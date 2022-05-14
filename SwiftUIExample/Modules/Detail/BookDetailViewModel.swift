//
//  BookDetailViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

public class BookDetailViewModel: ObservableObject {

    @Published
    public var book: Book
    private let repository: BookRepository

    public init(book: Book, repository: BookRepository) {
        self.book = book
        self.repository = repository
    }
    /// will reload the current book from repository
    public func reload() {
        repository.getBook(id: book.id, completion: { book in
            guard let book = book else { return }
            self.book = book
        })
    }
    public var author: String {
        book.author
    }
    public var title: String {
        book.title
    }
    public var description: String {
        book.description
    }
    public var cover: String {
        book.cover
    }
    public var stock: Int {
        book.stock
    }
    public var tags: [String] {
        book.tags
    }
    public var buyButton: String {
        "Buy for \(String(format: "%.2f", book.price))$"
    }
}
