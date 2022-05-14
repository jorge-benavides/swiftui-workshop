//
//  BookListViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

public class BookListViewModel: ObservableObject {

    /// data array for view
    @Published
    public var books: [Book] = []

    /// single source of truth for book catalog
    private let repository: BookRepository

    public init(_ repository: BookRepository) {
        self.repository = repository
        self.reload()
    }

    /// fetch asynchronously the books from repository
    public func reload() {
        self.repository.getBooks { books in
            self.books = books
        }
    }
}
