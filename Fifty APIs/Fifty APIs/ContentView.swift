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
        Item(title: "One"),
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
        VStack {
            List {
                ForEach(allItems) { item in
                    Text(item.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
