//
//  Sandwich.swift
//  IntroSwiftUI
//
//  Created by Alexis Beaudoin on 18/08/2021.
//

import Foundation

struct Sandwish: Identifiable {
    var id = UUID()
    var name: String
    var ingredientCount: Int
    var isSpicy: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + " thumb" }
}

let testData = [
    Sandwish(name: "Club", ingredientCount: 4, isSpicy: false),
    Sandwish(name: "Pastrami on rye", ingredientCount: 4, isSpicy: true),
    Sandwish(name: "French dip", ingredientCount: 3, isSpicy: false),
    Sandwish(name: "Bành mi", ingredientCount: 5, isSpicy: true),
    Sandwish(name: "Ice cream sandwich", ingredientCount: 2, isSpicy: false),
    Sandwish(name: "Croque madame", ingredientCount: 4, isSpicy: false),
    Sandwish(name: "Hot dog", ingredientCount: 2, isSpicy: true),
    Sandwish(name: "Flutternutter", ingredientCount: 2, isSpicy: false),
    Sandwish(name: "Avocado toast", ingredientCount: 3, isSpicy: true),
    Sandwish(name: "Gua bao", ingredientCount: 4, isSpicy: true),
]
