//
//  ContentView.swift
//  IntroSwiftUI
//
//  Created by Alexis Beaudoin on 18/08/2021.
//

import SwiftUI

struct ContentView: View {    
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    ForEach(store.sandwiches) { sandwich in
                        SandwichItem(sandwich: sandwich)
                    }
                    .onMove(perform: moveSandwich)
                    .onDelete(perform: deleteSandwich)

                    HStack {
                        Spacer()
                        Text("\(store.sandwiches.count) sandwiches")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Add", action: makeSandwich)
                    Spacer()
                    #if os(iOS)
                    EditButton()
                    #endif
                }
            }
            
            Text("Select a sandwich")
                .font(Font.largeTitle)
                .foregroundColor(.gray)
        }
    }

    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwish(name: "Patty melt", ingredientCount: 3))
        }
    }

    func moveSandwich(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwich(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct SandwichItem: View {
    var sandwich: Sandwish
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                ZStack {
                    Image(sandwich.thumbnailName)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                }
                .cornerRadius(8.0)
                .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("\(sandwich.name)")
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: testStore)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
