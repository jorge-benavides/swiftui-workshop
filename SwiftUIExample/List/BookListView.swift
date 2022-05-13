//
//  BookListView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

struct BookListView: View {

    let viewModel: BookListViewModel

    init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Text("")
            .navigationTitle("Books")
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var viewModel = BookListViewModel(books: [
        Book.mock,
        Book.mock,
        Book.mock,
        Book.mock,
        Book.mock
    ])
    static var previews: some View {
        BookListView(viewModel: viewModel)
        .previewDevice("iPhone 13")
    }
}
