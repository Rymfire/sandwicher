//
//  SandwichDetail.swift
//  IntroSwiftUI
//
//  Created by Alexis Beaudoin on 22/08/2021.
//

import SwiftUI

struct SandwichDetail: View {
    @State private var zoomed = false
    
    var sandwich: Sandwish
    
    var body: some View {
        VStack {
            ZStack {
                Image(sandwich.thumbnailName)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .onTapGesture {
                        withAnimation {
                            zoomed.toggle()
                        }
                    }
            }
            .cornerRadius(16.0)
            .padding(.init(top: 16.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            if zoomed == false {
                Text("Number of ingredients: \(sandwich.ingredientCount)")
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            if sandwich.isSpicy && zoomed == false {
                SpicyBanner()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(sandwich.name)
    }
    
}

struct SpicyBanner: View {
    var body: some View {
        HStack {
            Spacer()
            Label("Spicy", systemImage: "flame.fill")
                .font(Font.headline.smallCaps())
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding(.init(top: 16.0, leading: 16.0, bottom: 32.0, trailing: 16.0))
        .background(Color.red)
        .transition(.move(edge: .bottom))
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetail(sandwich: testData[1])
        }
        NavigationView {
            SandwichDetail(sandwich: testData[0])
        }
    }
}
