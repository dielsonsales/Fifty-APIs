//
//  BackgroundTaskView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 04/10/25.
//

import SwiftUI
import UIKit

struct BackgroundTaskView: View {
    var body: some View {
        Button("Start background task") {
            Task {
                if #available(iOS 26.0, *) {
                    AppDelegate.instance.scheduleContinuedProcessingTask()
                } else {
                    // Fallback on earlier versions
                    print("ContinuedBackgroundTask not available before iOS 26")
                }
            }
        }
    }
}

#Preview {
    BackgroundTaskView()
}
