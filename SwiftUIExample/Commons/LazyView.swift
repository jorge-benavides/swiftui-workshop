//
//  LazyView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import SwiftUI

public struct LazyView<T: View>: View {
    /// building clouser for the view
    private let build: () -> T

    public init(_ build: @escaping () -> T) {
        self.build = build
    }

    /// will lazily load a view when required
    public var body: T {
        build()
    }
}
