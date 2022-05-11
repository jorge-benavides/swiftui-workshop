//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 11/05/22.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            BookDetailView(viewModel: BookDetailView_Previews.viewModel)
        }
    }
}
