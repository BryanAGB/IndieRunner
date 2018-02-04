//
//  GameScene.swift
//  Super Indie Runner
//
//  Created by Bryan on 04/02/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var mapNode: SKNode!
    var tileMap: SKTileMapNode!
    
    
    
    override func didMove(to view: SKView) {
        load(level: "Level_0-1")
    }

    func load(level: String) {
        if let levelNode = SKNode.unarchiveFromFile(file: level){
            mapNode = levelNode
            addChild(mapNode)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
