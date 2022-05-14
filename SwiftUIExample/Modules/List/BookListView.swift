//
//  BookListView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

public struct BookListView: View {
    @EnvironmentObject
    private var repository: BookRepository

    @ObservedObject
    private var viewModel: BookListViewModel

    public init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            List(viewModel.books) { book in
                NavigationLink(destination: {
                    // Will prevent to load the view untill the user navigates
                    LazyView {
                        detailView(book)
                    }
                    .onDisappear() {
                        // on comming back we reload the data
                        reload()
                    }
                }, label: {
                    itemView(book)
                })
            }
            .navigationTitle("Book list")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    /// creates an configures the cellview for the list
    private func itemView(_ book: Book) -> some View {
        BookListItemView(viewModel: BookListItemViewModel(book: book))
    }

    /// creates a book detailview with his dependency view model
    private func detailView(_ book: Book) -> some View {
        BookDetailView(viewModel: BookDetailViewModel(book: book, repository: repository))
    }

    /// reload book states when viewModel updates the property
    private func reload() {
        viewModel.reload()
    }
}

struct BookListView_Previews: PreviewProvider {
    static var viewModel = BookListViewModel(BookRepository())
    static var previews: some View {
        BookListView(viewModel: viewModel)
            .previewSetup()
    }
}
