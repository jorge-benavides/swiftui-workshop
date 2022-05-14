//
//  CartView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

public struct CartView: View {

    private let viewModel: CartViewModel

    @Binding
    private var showModal: Bool
    @State
    private var showingAlert = false

    @State
    private var jiggling = false
    @State
    private var jiggling_counter = 0

    @State
    private var scale_effect = 1.2
    @State
    private var rotation_angle_base: Double = 15
    @State
    private var rotation_angle: Double = 0

    public init(viewModel: CartViewModel, showModal: Binding<Bool>) {
        self.viewModel = viewModel
        self._showModal = showModal
    }

    public var body: some View {
        VStack(alignment: .center) {
            Text("Your Bag")
                .font(.title)
                .bold()
            Text("\(viewModel.items.count) items")
                .foregroundColor(.gray)
            ForEach(viewModel.items, id: \.self) { book in
                CartItemView(viewModel: CartItemViewModel(book: book),
                             jiggling: self.$jiggling,
                             rotationValue: self.$rotation_angle,
                             scaleValue: self.$scale_effect)
            }
            CartItemView(viewModel: CartItemViewModel(title: "Total:", image: "DeliverIcon", price: viewModel.total))
            Divider().padding()
            Button(action: {
                self.showingAlert.toggle()
            }, label: {
                CheckoutButton("Checkout")
            })
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear() {
            jiggle_shipping_icon(apply_delay: false)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Thank you for your purchase."),
                  dismissButton: .default(Text("Done")) {
                self.viewModel.trigger(.checkout)
                self.showModal.toggle()
            })
        }
    }

    private func jiggle_shipping_icon(apply_delay: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + (apply_delay ? 5 : 0)) {
            withAnimation() {
                jiggling.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation() {
                    jiggling.toggle()
                }
                jiggling_counter += 1

                if(jiggling_counter == 4){
                    jiggling_counter = 0
                    rotation_angle = -rotation_angle_base
                    jiggle_shipping_icon(apply_delay: true)
                } else {
                    if(rotation_angle < 0){
                        rotation_angle = rotation_angle_base
                    } else {
                        rotation_angle = -rotation_angle_base
                    }
                    jiggle_shipping_icon(apply_delay: false)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var cart: Cart {
        let c = Cart(repository: BookRepository())
        c.addItem(Mocks.towers)
        c.addItem(Mocks.man)
        c.addItem(Mocks.homo)
        return c
    }
    static var previews: some View {
        CartView(viewModel: CartViewModel(cart: cart),
                 showModal: .constant(true))
        .previewDevice("iPhone 13")
    }
}
