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
    private var cart: Cart

    public init(cart: Cart) {
        self.cart = cart
    }

    var items: [Book] {
        cart.items
    }
    var total: Double {
        cart.total
    }

    func trigger(_ action: CartViewModelActions) {
        switch action {
        case .checkout:
            cart.checkout()
        }
    }
}
