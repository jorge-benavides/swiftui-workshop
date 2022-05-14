//
//  BookListViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

class BookListViewModel: ObservableObject {

    @Published var books: [Book] = []

    private let repository: BookRepository

    init(_ repository: BookRepository) {
        self.repository = repository
        self.reload()
    }

    public func reload() {
        self.repository.getBooks { books in
            self.books = books
        }
    }
}
