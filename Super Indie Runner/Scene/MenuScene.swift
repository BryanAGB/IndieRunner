//
//  MenuScene.swift
//  Super Indie Runner
//
//  Created by Bryan Mansell on 21/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    
    var sceneManagerDelegate : SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        
        layoutView()
        
    }
    
    func layoutView (){
        
        let logoLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        logoLabel.text = GameConstants.StringConstants.gameName
        logoLabel.fontSize = 200.0
        logoLabel.fontColor = UIColor.white
        logoLabel.scale(to: frame.size, width: true, multiplier: 0.8)
        logoLabel.position = CGPoint(x: frame.midX, y: frame.maxY * 0.75 - logoLabel.frame.size.height / 2)
        logoLabel.zPosition = GameConstants.ZPositions.hudZ
        addChild(logoLabel)
        
        let startButton = SpriteKitButton(defaultButtonImage: GameConstants.StringConstants.playButton, action: goToLevelScene, index: 0)
        startButton.scale(to: frame.size, width: false, multiplier: 0.1)
        startButton.position = CGPoint(x: frame.midX, y: frame.midY)
        startButton.zPosition = GameConstants.ZPositions.hudZ
        addChild(startButton)
        
    }
    
    
    func goToLevelScene(_: Int) {
        
        sceneManagerDelegate?.presentLevelScene(for: 0)
    }
    
}
