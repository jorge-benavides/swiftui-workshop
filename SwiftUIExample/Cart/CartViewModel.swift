//
//  CartViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

enum CartViewModelActions {
    case checkout
}
struct CartViewModel {

    var books: [Book]

    func trigger(_ action: CartViewModelActions) {
        print(action)
    }
}
