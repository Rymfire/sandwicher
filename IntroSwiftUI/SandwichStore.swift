//
//  SandwichStore.swift
//  IntroSwiftUI
//
//  Created by Alexis Beaudoin on 23/08/2021.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwish]
    
    init(sandwiches: [Sandwish] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
