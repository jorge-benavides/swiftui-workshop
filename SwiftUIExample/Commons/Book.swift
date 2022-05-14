//
//  Book.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: String
    let title: String
    let author: String
    let description: String
    var price: Double
    let cover: String
    var stock: Int
    let tags: [String]
}
