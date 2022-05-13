//
//  Book.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: String
    let author: String
    let title: String
    let description: String
    let price: Double
    let cover: String
    let tags: [String]
}

extension Book {
    static var mock: Book {
        Book(id: UUID().uuidString,
             author: "J.R.R Tolkien",
             title: "The Fellowship of the Ring",
             description: "The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend.",
             price: 18.85,
             cover: "BookCover",
             tags: ["Fantasy", "Action", "Novel"])
    }
}
