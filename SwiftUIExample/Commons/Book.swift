//
//  Book.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import Foundation

public struct Book: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let author: String
    public let description: String
    public var price: Double
    public let cover: String
    public var stock: Int
    public let tags: [String]
}
