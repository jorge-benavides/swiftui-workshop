//
//  BookListItemView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import SwiftUI

public struct BookListItemView: View {

    private let viewModel: BookListItemViewModel

    public init(viewModel: BookListItemViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 10) {
            BookCoverView(viewModel.cover, width: 80)
                .padding()
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                Text(viewModel.author)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                Text(viewModel.price)
                    .font(.title)
                    .lineLimit(1)
                    .padding(.vertical, 10)
            }
            .multilineTextAlignment(.leading)
        }
    }
}

struct BookListItemView_Previews: PreviewProvider {
    static var viewModel = BookListItemViewModel(book: Mocks.fellow)
    static var previews: some View {
        NavigationView{
            List {
                NavigationLink(destination: {

                }, label: {
                    BookListItemView(viewModel: viewModel)
                })
            }
        }

        .previewDevice("iPhone 13")
    }
}
