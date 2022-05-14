//
//  BookDetailView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import SwiftUI

public struct BookDetailView: View {

    @EnvironmentObject
    private var cart: Cart

    @ObservedObject
    private var viewModel: BookDetailViewModel

    public init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
    }

    @State
    private var showModal = false

    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 10) {
                BookCoverView(viewModel.cover)
                Text(viewModel.author)
                    .padding(.top, 10)
                    .foregroundColor(.gray)
                Text(viewModel.title)
                    .fontWeight(.bold)
                    .padding(5)
                Text(viewModel.description)
                    .font(.system(size: 14.0))
                    .foregroundColor(.gray)
                    .padding()
                    .lineLimit(4)
                HStack(spacing: 10) {
                    ForEach(viewModel.tags, id: \.self) { title in
                        BookDetailLabel(title)
                    }
                }
                Spacer()
                Divider()
                Spacer()
                Button {
                    withAnimation {
                        showCart(addingBook: true)
                    }
                } label: {
                    Text(viewModel.buyButton)
                }
                .padding(.init(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(.black)
                .foregroundColor(showModal ? .gray : .white)
                .cornerRadius(20)
            }
            .multilineTextAlignment(.center)
        }
        .sheet(isPresented: self.$showModal, onDismiss: {
            reload()
        }) {
            CartView(viewModel: CartViewModel(cart: cart), showModal: self.$showModal)
        }
        .navigationBarItems(trailing:
            Button(action: {
                showCart()
            }) {
                Image(systemName: "cart.circle")
                    .padding(10)
            }
        )
    }
    /// will present modally the cart view with the option of adding the book on display
    private func showCart(addingBook: Bool = false) {
        if addingBook {
            self.cart.addItem(viewModel.book)
        }
        self.showModal = true
    }
    /// tells the view model to reload the data in case the user completed checkout
    private func reload() {
        viewModel.reload()
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var viewModel = BookDetailViewModel(book: Mocks.fellow, repository: BookRepository())
    static var previews: some View {
        NavigationView {
            BookDetailView(viewModel: viewModel)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Book list")
                    }.foregroundColor(.blue)
                }
            })
        }
        .previewSetup()
    }
}
