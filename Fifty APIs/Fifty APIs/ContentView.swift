//
//  ContentView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 03/10/25.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    let allItems = [
        Item(title: "TipKitView"),
        Item(title: "Two"),
        Item(title: "Three"),
        Item(title: "Four"),
        Item(title: "Five"),
        Item(title: "Six"),
        Item(title: "Seven"),
        Item(title: "Eight"),
        Item(title: "Nine"),
        Item(title: "Ten")
    ]
    var body: some View {
        NavigationStack {
            List {
                ForEach(allItems) { item in
                    NavigationLink(item.title) {
                        destination(for: item)
                    }
                }
            }
            .navigationTitle("All Items")
        }
    }

    @ViewBuilder
    private func destination(for item: Item) -> some View {
        switch item.title {
        case "TipKitView":
            TipKitView()
        default:
            Text("Not implemented yet")
        }
    }
}

#Preview {
    ContentView()
}
