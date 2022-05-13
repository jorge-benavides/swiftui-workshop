//
//  LazyView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import SwiftUI

struct LazyView<T: View>: View {
    let build: () -> T
    init(_ build: @escaping () -> T) {
        self.build = build
    }
    var body: T {
        build()
    }
}
