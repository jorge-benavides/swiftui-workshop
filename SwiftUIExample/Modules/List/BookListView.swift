//
//  BookListView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

struct BookListView: View {
    @EnvironmentObject var repository: BookRepository

    @ObservedObject
    var viewModel: BookListViewModel

    init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.books) { book in
                NavigationLink(destination: {
                    LazyView {
                        detailView(book)
                    }
                    .onDisappear() {
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

    func itemView(_ book: Book) -> some View {
        BookListItemView(viewModel: BookListItemViewModel(book: book))
    }

    func detailView(_ book: Book) -> some View {
        BookDetailView(viewModel: BookDetailViewModel(book: book, repository: repository))
    }

    func reload() {
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
