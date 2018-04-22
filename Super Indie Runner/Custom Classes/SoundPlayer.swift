//
//  SoundPlayer.swift
//  Super Indie Runner
//
//  Created by Bryan on 22/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class SoundPlayer {
    
    let buttonSound = SKAction.playSoundFileNamed("button", waitForCompletion: false)
    let coinSound = SKAction.playSoundFileNamed("coin", waitForCompletion: false)
    let deathSound = SKAction.playSoundFileNamed("gameover", waitForCompletion: false)
    let completedSound = SKAction.playSoundFileNamed("completed", waitForCompletion: false)
    let powerupSound = SKAction.playSoundFileNamed("powerup", waitForCompletion: false)
    
}
