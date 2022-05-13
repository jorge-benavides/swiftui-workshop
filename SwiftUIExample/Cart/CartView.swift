//
//  CartView.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 12/05/22.
//

import SwiftUI

struct CartView: View {

    let viewModel: CartViewModel

    @Binding var showModal: Bool
    @State private var showingAlert = false

    @State private var jiggling = false
    @State private var jiggling_counter = 0

    @State var scale_effect = 1.2
    @State var rotation_angle_base: Double = 15
    @State private var rotation_angle: Double = 0

    public init(viewModel: CartViewModel, showModal: Binding<Bool>) {
        self.viewModel = viewModel
        self._showModal = showModal
    }

    var animation: Animation {
        .easeInOut
    }
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Text("Your Bag")
                    .font(.title)
                    .bold()
                Text("\(viewModel.books.count) items")
                    .foregroundColor(.gray)
                ForEach(viewModel.books, id: \.self) { book in
                    CartItemView(name: book.title,
                                 image: book.cover,
                                 price: book.price,
                                 jiggling: self.$jiggling,
                                 rotationValue: self.$rotation_angle,
                                 scaleValue: self.$scale_effect)
                }
                CartItemView(name: "Total:", image: "DeliverIcon", price: viewModel.books.map({ $0.price }).reduce(0, +))
                Divider().padding()
                Button(action: {
                    self.showingAlert.toggle()
                }, label: {
                    CheckoutButton("Checkout")
                })
            }
        }
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

    func jiggle_shipping_icon(apply_delay: Bool) {
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



struct CheckoutButton: View {
    let title: String
    public init(_ title: String) {
        self.title = title
    }
    var body: some View {
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel(books: [Book.mock, Book.mock, Book.mock]),
                 showModal: .constant(true))
        .previewDevice("iPhone 13")
    }
}
