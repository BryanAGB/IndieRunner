//
//  ObjectHelper.swift
//  Super Indie Runner
//
//  Created by Bryan on 14/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class ObjectHelper {
    
    static func handleChild(sprite: SKSpriteNode, with name: String) {
        
        switch name {
        case GameConstants.StringConstants.finishLineName, GameConstants.StringConstants.enemyName :
            PhysicsHelper.addPhysicsBody(to: sprite, with: name)
        default : break
        }
        
    }
    
}
