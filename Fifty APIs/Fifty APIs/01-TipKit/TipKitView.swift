//
//  TipKitView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 03/10/25.
//

import SwiftUI
import TipKit

struct MyTip: Tip {
    var title: Text {
        Text("Save a favorite")
    }
    var message: Text? {
        Text("Add this favorite to your list of favorites")
    }
    var image: Image? {
        nil
    }
}

struct TipKitView: View {
    let myTip = MyTip()
    var body: some View {
        VStack {
            Image(systemName: "star")
                .popoverTip(myTip)
        }
        .navigationTitle(Screen.tipKitView)
        .task {
            do {
                try Tips.configure()
            } catch {
                print("Error configuring tips: \(error)")
            }
        }
    }
}

#Preview {
    TipKitView()
}
