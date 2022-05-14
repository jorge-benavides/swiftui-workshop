//
//  CheckoutButton.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 14/05/22.
//

import SwiftUI

public struct CheckoutButton: View {

    private let title: String

    public init(_ title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding()
            .padding(.horizontal, 50)
            .foregroundColor(.white)
            .background(.yellow)
            .cornerRadius(40)
    }
}

struct CheckoutButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutButton("Checkout $0.00")
    }
}
