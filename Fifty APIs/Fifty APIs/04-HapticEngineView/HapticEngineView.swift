//
//  HapticEngineView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 04/10/25.
//

import CoreHaptics
import SwiftUI

struct HapticEngineView: View {
    var engine: CHHapticEngine? = try? CHHapticEngine()
    let hapticDict = [
        CHHapticPattern.Key.pattern: [
            [CHHapticPattern.Key.event: [
                CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                CHHapticPattern.Key.time: CHHapticTimeImmediate,
                CHHapticPattern.Key.eventDuration: 1.0]
            ]
        ]
    ]
    var body: some View {
        Button("Play haptic") {
            print("Playing haptic")
            do {
                let pattern = try CHHapticPattern(dictionary: hapticDict)
                let player = try engine?.makePlayer(with: pattern)
                engine?.notifyWhenPlayersFinished { error in
                    return .stopEngine
                }
                try engine?.start()
                try player?.start(atTime: 0)
            } catch {
                print("Error starting engine: \(error)")
            }
        }
    }
}
