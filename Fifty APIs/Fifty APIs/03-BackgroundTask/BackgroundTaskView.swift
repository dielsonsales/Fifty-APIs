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
//                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//                    print("Couldn't find AppDelegate")
//                    return
//                }
                AppDelegate.instance.scheduleContinuedProcessingTask()
//                appDelegate.scheduleContinuedProcessingTask()
            }
        }
    }
}

#Preview {
    BackgroundTaskView()
}
