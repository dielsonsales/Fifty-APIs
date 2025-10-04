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

enum Screen {
    static let tipKitView = "TipKitView"
    static let barChartsView = "BarChartsView"
}

struct ContentView: View {
    let allItems = [
        Item(title: Screen.tipKitView),
        Item(title: Screen.barChartsView),
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
                ForEach(allItems.indices, id: \.self) { index in
                    let item = allItems[index]
                    NavigationLink("\(index + 1) - \(item.title)") {
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
        case Screen.tipKitView:
            TipKitView()
        case Screen.barChartsView:
            BarChartsView()
        default:
            Text("Not implemented yet")
        }
    }
}

#Preview {
    ContentView()
}
