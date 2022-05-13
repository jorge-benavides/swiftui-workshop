//
//  BookDetailView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import SwiftUI

struct BookDetailView: View {

    let viewModel: BookDetailViewModel

    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
    }

    @State private var showModal = false
    @State private var showAlert = false
    @State private var animate = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 10) {
                Button(action: {

                }, label: {
                    Image(viewModel.poster)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 180, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .background(.black)
                        .cornerRadius(12)
                        .shadow(color: .black, radius: showModal ? 8: 0, x: 0, y: showModal ? 3: 0)
                        .scaleEffect(showModal ? 1.1 : 1)
                })
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
                        BookDetailLabel(text: title)
                    }
                }
                Spacer()
                Divider()
                Spacer()
                Button {
                    withAnimation {
                        showModal.toggle()
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
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showModal = true
                                }) {
                                    Text("Cart")
                                }
                                .foregroundColor(.white)
                                .background(.blue)
                                .padding()
                                .sheet(isPresented: self.$showModal, onDismiss: { self.reload() }) {
                                    CartView(viewModel: CartViewModel(books: [Book.mock,
                                                                              Book.mock,
                                                                              Book.mock,
                                                                              Book.mock]),
                                             showModal: self.$showModal)
                                }
        )
        
    }

    func reload() {
        print("Idk how to reload")
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var viewModel = BookDetailViewModel(book: Book.mock)
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
        .previewDevice("iPhone 13")
    }
}
