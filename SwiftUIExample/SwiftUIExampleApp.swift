//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {

    @StateObject var repository = BookRepository()

    var body: some Scene {
        WindowGroup {
            BookListView(viewModel: BookListViewModel(repository))
                .environmentObject(repository)
                .environmentObject(Cart(repository: repository))
        }
    }
}

extension View {
    func previewSetup() -> some View {
        self
            .environmentObject(BookRepository())
            .environmentObject(Cart(repository: BookRepository()))
            .previewDevice("iPhone 13")
    }
}
