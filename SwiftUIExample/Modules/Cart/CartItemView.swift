//
//  CartItemView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

public struct CartItemView: View {
    
    let name: String
    let image: String
    let price: Double

    @Binding var jiggling: Bool
    @Binding var rotationValue: Double
    @Binding var scaleValue: Double

    public init(name: String,
                image: String,
                price: Double,
                jiggling: Binding<Bool> = .constant(false),
                rotationValue: Binding<Double> = .constant(0),
                scaleValue: Binding<Double> = .constant(0)) {
        self.name = name
        self.image = image
        self.price = price
        self._jiggling = jiggling
        self._rotationValue = rotationValue
        self._scaleValue = scaleValue
    }
    
    public var body: some View {
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.horizontal, 30)
                .rotationEffect(.degrees(jiggling ? Double(rotationValue) : 0))
                .scaleEffect(jiggling ? scaleValue : 1)
                .animation(.linear(duration: 0.15), value: jiggling)

            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.gray)
                Text(String(format: "$%.2f", price))
                    .font(.title)
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(name: Mocks.fellow.title, image: Mocks.fellow.cover, price: Mocks.fellow.price)
    }
}

