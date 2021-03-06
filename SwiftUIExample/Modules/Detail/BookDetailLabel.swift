//
//  BookDetailLabel.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import SwiftUI

public struct BookDetailLabel: View {
    private var text: String

    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct BookDetailLabelView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailLabel("Fantasy")
    }
}
