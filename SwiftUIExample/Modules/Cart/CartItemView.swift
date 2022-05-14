//
//  CartItemView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

public struct CartItemView: View {
    
    private let viewModel: CartItemViewModel

    @Binding
    private var jiggling: Bool
    @Binding
    private var rotationValue: Double
    @Binding
    private var scaleValue: Double
    
    public init(viewModel: CartItemViewModel,
                jiggling: Binding<Bool> = .constant(false),
                rotationValue: Binding<Double> = .constant(0),
                scaleValue: Binding<Double> = .constant(0)) {
        self.viewModel = viewModel
        self._jiggling = jiggling
        self._rotationValue = rotationValue
        self._scaleValue = scaleValue
    }
    
    public var body: some View {
        HStack {
            Image(viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.horizontal, 30)
                .rotationEffect(.degrees(jiggling ? Double(rotationValue) : 0))
                .scaleEffect(jiggling ? scaleValue : 1)
                .animation(.linear(duration: 0.15), value: jiggling)

            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .foregroundColor(.gray)
                Text(viewModel.price)
                    .font(.title)
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(viewModel: CartItemViewModel(book: Mocks.fellow))
    }
}

