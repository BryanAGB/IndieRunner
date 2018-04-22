//
//  Player.swift
//  Super Indie Runner
//
//  Created by Bryan on 11/02/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

enum PlayerState {
    case idle, running
}

class Player: SKSpriteNode {
    
    var runFrames = [SKTexture]()
    var idleFrames = [SKTexture]()
    var jumpFrames = [SKTexture]()
    var dieFrames = [SKTexture]()
    
    var state = PlayerState.idle {
        willSet{
            animate(for: newValue)
        }
    }
    
    var airborne = false
    
    var invincible = false
    
    func loadTextures() {
        idleFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerIdleAtlas), withName: GameConstants.StringConstants.idlePrefixKey)
        
        runFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerRunAtlas), withName: GameConstants.StringConstants.runPrefixKey)
        
        jumpFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerJumpAtlas), withName: GameConstants.StringConstants.jumpPrefixKey)
        
        dieFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerDieAtlas), withName: GameConstants.StringConstants.diePrefixKey)
    }
    
    func animate(for state: PlayerState) {
        removeAllActions()
        switch state {
        case .idle:
            self.run(SKAction.repeatForever(SKAction.animate(with: idleFrames, timePerFrame: 0.05, resize: true, restore: true)))
        case .running:
            self.run(SKAction.repeatForever(SKAction.animate(with: runFrames, timePerFrame: 0.05, resize: true, restore: true)))
    }
     
    }
        func activatePowerup(active: Bool) {
            if active {
                if let poweupEffect = ParticleHelper.addParticleEffect(name: GameConstants.StringConstants.powerUpEmitterKey, particlePositionRange: CGVector(dx: 0.0, dy: size.height), position: CGPoint(x: -size.width, y: 0.0)) {
                    poweupEffect.zPosition = GameConstants.ZPositions.objectZ
                    addChild(poweupEffect)
                    invincible = true
                    run(SKAction.wait(forDuration: 5.0), completion: {
                        self.activatePowerup(active: false)
                    })
                }
            } else {
                invincible = false
                ParticleHelper.removeParticleEffect(name: GameConstants.StringConstants.powerUpEmitterKey, from: self)
            }
}
}
