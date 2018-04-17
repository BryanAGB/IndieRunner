//
//  BannerLabel.swift
//  Super Indie Runner
//
//  Created by Bryan Mansell on 16/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class BannerLabel: SKSpriteNode {

    init(withTitle : String) {
        let texture = SKTexture(imageNamed: GameConstants.StringConstants.bannerName)
    
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
   
        let label = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        label.fontSize = 200.0
        label.verticalAlignmentMode = .center
        label.text = withTitle
        label.scale(to: size, width: false, multiplier: 0.3)
        label.zPosition = GameConstants.ZPositions.hudZ
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
