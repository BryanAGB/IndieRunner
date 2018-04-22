//
//  SpriteKitButton.swift
//  Super Indie Runner
//
//  Created by Bryan Mansell on 17/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class SpriteKitButton : SKSpriteNode {
    
    let soundPlayer = SoundPlayer()
    var defaultButton : SKSpriteNode
    var action: (Int) -> ()
    var index : Int
    
    init(defaultButtonImage: String, action: @escaping (Int) -> (), index: Int) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        self.action = action
        self.index = index
        
        super.init(texture: nil, color: UIColor.clear, size: defaultButton.size)
        
        isUserInteractionEnabled = true
        addChild(defaultButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        run(soundPlayer.buttonSound)
        defaultButton.alpha = 0.75
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.location(in: self)
        
        if defaultButton.contains(location) {
            defaultButton.alpha = 0.75
        }
        else {
            defaultButton.alpha = 1.0
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.location(in: self)
        
        if defaultButton.contains(location) {
            action(index)
        }
        defaultButton.alpha = 1.0
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        defaultButton.alpha = 1.0
    }
    
}
