//
//  BookListViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

struct BookListViewModel {

    let repository: BookRepository

    init(repository: BookRepository = BookRepository()) {
        self.repository = repository
    }

    var books: [Book] {
        repository.books
    }
    func book(for index: Int) -> Book {
        books[index]
    }
}
