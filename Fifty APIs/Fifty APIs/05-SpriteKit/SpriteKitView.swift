//
//  SpriteKitView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 04/10/25.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    private var sprite = SKSpriteNode(imageNamed: "sprite1")

    override func didMove(to view: SKView) {
        backgroundColor = .gray
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(sprite)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveSprite(to: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveSprite(to: touches)
    }

    private func moveSprite(to touches: Set<UITouch>) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        sprite.removeAllActions()
        let distance = hypot(location.x - sprite.position.x, location.y - sprite.position.y)
        let speed: CGFloat = 200 // points per second
        let duration = distance / speed
        let moveAction = SKAction.move(to: location, duration: duration)
        moveAction.timingMode = .easeInEaseOut
        sprite.run(moveAction)
    }
}

struct SpriteKitView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 400, height: 600)
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 400, height: 600)
            .ignoresSafeArea()
    }
}
