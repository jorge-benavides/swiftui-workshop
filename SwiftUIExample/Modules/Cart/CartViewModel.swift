//
//  CartViewModel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import Foundation

public enum CartViewModelActions {
    case checkout
}

public struct CartViewModel {
    private var cart: Cart

    public init(cart: Cart) {
        self.cart = cart
    }

    public var items: [Book] {
        cart.items
    }
    public var total: String {
        "$\(String(format: "%.2f", cart.total))"
    }

    /// propagates user action to the share cart instance
    public func trigger(_ action: CartViewModelActions) {
        switch action {
        case .checkout:
            cart.checkout()
        }
    }
}
