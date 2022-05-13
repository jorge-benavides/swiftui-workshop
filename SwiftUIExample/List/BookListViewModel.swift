//
//  BookListViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

struct BookListViewModel {
    var books: [Book]

    func book(for index: Int) {
        books[index]
    }
}
