//
//  CartItemViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 14/05/22.
//

import Foundation

public struct CartItemViewModel {

    public let title: String
    public let image: String
    public let price: String

    public init(title: String,
                image: String,
                price: String) {
        self.title = title
        self.image = image
        self.price = price
    }

    public init(book: Book) {
        self.init(title: book.title, image: book.cover, price: "$\(String(format: "%.2f", book.price))")
    }
}
