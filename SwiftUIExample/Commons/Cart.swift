//
//  Cart.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 14/05/22.
//

import Foundation

class Cart: ObservableObject {

    let repository: BookRepository
    public init(repository: BookRepository) {
        self.repository = repository
    }

    @Published var items: [Book] = []
    @Published var total: Double = 0

    func addItem(_ book: Book) {
        items.append(book)
        total += book.price
    }

    func removeItem(_ book: Book) {
        guard let index = items.firstIndex(of: book) else { return }
        items.remove(at: index)
        total -= book.price
    }

    func checkout() {
        items.forEach { book in
            var book = book
            book.price += 1
            book.stock -= 1
            self.repository.update(book: book)
        }
        items.removeAll()
        total = 0
    }
}
