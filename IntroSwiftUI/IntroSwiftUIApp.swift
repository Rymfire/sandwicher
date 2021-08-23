//
//  IntroSwiftUIApp.swift
//  IntroSwiftUI
//
//  Created by Alexis Beaudoin on 18/08/2021.
//

import SwiftUI

@main
struct IntroSwiftUIApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
