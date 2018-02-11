//
//  PhysicsHelper.swift
//  Super Indie Runner
//
//  Created by Bryan on 11/02/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class PhysicsHelper {
    
    static func addPhysicsBody(to sprite: SKSpriteNode, with name: String) {
    
        switch name {
        case GameConstants.StringConstants.playerName:
            sprite.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sprite.size.width/2, height: sprite.size.height))
            sprite.physicsBody!.restitution = 0.0
            sprite.physicsBody!.allowsRotation = false
        default: sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        }
        
    }

}
