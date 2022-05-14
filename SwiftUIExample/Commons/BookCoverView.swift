//
//  BookCoverView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 13/05/22.
//

import SwiftUI

struct BookCoverView: View {
    let cover: String
    let width: CGFloat?

    public init(_ cover: String, width: CGFloat? = 120) {
        self.cover = cover
        self.width = width
    }

    var aspectRatio: CGFloat = 0.6
    var height: CGFloat? {
        guard let width = width else {
            return nil
        }
        return width / aspectRatio
    }

    @State
    private var hover = false

    var body: some View {
        Image(cover)
            .resizable()
            .frame(width: width,
                   height: height,
                   alignment: .center)
            .aspectRatio(contentMode: .fit)
            .background(.black)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.3), radius: hover ? 8: 0, x: 2, y: hover ? 6: 0)
            .scaleEffect(hover ? 1 : 0.8)
            .onAppear() {
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.75)) {
                        self.hover = true
                    }
                }
            }
    }
}

struct BookCoverView_Previews: PreviewProvider {
    static var previews: some View {
        BookCoverView("BookCover", width: 120)
    }
}
