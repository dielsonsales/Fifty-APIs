//
//  AppDelegate.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 04/10/25.
//

import BackgroundTasks
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    enum Constants {
        static let taskIdentifier = "me.diel.Fifty-APIs"
    }

    static private(set) var instance: AppDelegate!

    // MARK: - UIApplicationDelegate

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        AppDelegate.instance = self
        BGTaskScheduler.shared.register(
            forTaskWithIdentifier: Constants.taskIdentifier,
            using: nil
        ) { task in
            guard let task = task as? BGContinuedProcessingTask else {
                return
            }
            print("Calling handleContinuedProcessing")
            self.handleContinuedProcessing(task: task)
        }
        return true
    }

    // MARK: - Public API

    func scheduleContinuedProcessingTask() {
        print("Scheduling continued processing task...")
        let request = BGContinuedProcessingTaskRequest(
            identifier: Constants.taskIdentifier,
            title: "Some background task",
            subtitle: "It's doing nothing, don't worry"
        )
        request.strategy = .fail
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule continued processing: \(error)")
        }
    }

    // MARK: - Private methods

    private func handleContinuedProcessing(task: BGContinuedProcessingTask) {
        task.expirationHandler = {
            print("Task expired!")
        }
        DispatchQueue.global().async {
            print("Running doSomeWork from a background thread...")
            self.doSomeWork()
            task.setTaskCompleted(success: true)
        }
    }

    private func doSomeWork() {
        for i in 1...10 {
            print("Background work \(i)...")
            Thread.sleep(forTimeInterval: 2)
        }
    }


}
