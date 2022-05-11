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

    @State var buy: Bool = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 10) {
                Image(viewModel.poster)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 180, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .background(.black)
                    .cornerRadius(12)
                    .shadow(color: .black, radius: buy ? 8: 0, x: 0, y: buy ? 3: 0)
                    .scaleEffect(buy ? 1.1 : 1)
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
                        buy.toggle()
                    }
                } label: {
                    Text(viewModel.buyButton)
                }
                .padding(.init(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(.black)
                .foregroundColor(buy ? .gray : .white)
                .cornerRadius(20)
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var viewModel = BookDetailViewModel(book: Book(author: "J.R.R Tolkien",
                                                 title: "The Fellowship of the Ring",
                                                 description: "The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend.",
                                                 price: "18.85$",
                                                 poster: "MoviePoster",
                                                 tags: ["Fantasy", "Action", "Novel"]))
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
