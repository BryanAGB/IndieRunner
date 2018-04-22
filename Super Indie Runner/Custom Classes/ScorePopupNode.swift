//
//  ScorePopupNode.swift
//  Super Indie Runner
//
//  Created by Bryan Mansell on 16/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class ScorePopupNode: PopupNode {
    
    var level : String
    var score : [String:Int]
    var scoreLabel: SKLabelNode!
    
    init(buttonHandlerDelegate: PopupButtonHandlerDelegate, title: String, level: String, texture: SKTexture, score: Int, coins: Int, animated: Bool){
        self.level = level
        self.score = ScoreManager.getCurrentScore(for: level)
        
        super.init(withTitle: title, and: texture, buttonHandlerDelegate: buttonHandlerDelegate)
        
        addScoreLabel()
        addStars()
        addCoins(count: coins)
        
        if animated {
            animateResult(with: CGFloat(score), and: 100.0)
        } else{
            scoreLabel.text = "\(score)"
            for i in 0..<self.score[GameConstants.StringConstants.scoreStarsKey]! {
                self[GameConstants.StringConstants.fullStarName + "_\(i)"].first!.alpha = 1.0
            }
        }
    }
    
    func addScoreLabel(){
        scoreLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        scoreLabel.fontSize = 200.0
        scoreLabel.text = "0"
        scoreLabel.scale(to: size, width: false, multiplier: 0.1)
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - size.height * 0.6)
        scoreLabel.zPosition = GameConstants.ZPositions.hudZ
        addChild(scoreLabel)
        
    }
    
    func addStars(){
        
        for i in 0...2 {
            let empty = SKSpriteNode(imageNamed: GameConstants.StringConstants.emptyStarName)
            let star = SKSpriteNode(imageNamed: GameConstants.StringConstants.fullStarName)
            
            empty.scale(to: size, width: true, multiplier: 0.25)
            empty.position = CGPoint(x: -empty.size.width + CGFloat(i) * empty.size.width, y: frame.maxY - size.height * 0.4)
            if i == 1 {
                empty.position.y += empty.size.height / 4
            }
             empty.zRotation = -CGFloat(-M_PI_4/2) + CGFloat(i) * CGFloat(-M_PI_4/2)
            empty.zPosition = GameConstants.ZPositions.hudZ
            
            
            star.size = empty.size
            star.position = empty.position
            star.zRotation = empty.zRotation
            star.zPosition = GameConstants.ZPositions.hudZ + 1
            star.name = GameConstants.StringConstants.fullStarName + "_\(i)"
            star.alpha = 0.0
            
            addChild(empty)
            addChild(star)
        }
        
    }
    
    func addCoins(count: Int) {
    
        let numberOfCoins = count == 4 ? score[GameConstants.StringConstants.scoreCoinsKey]! : count
        
        let coin = SKSpriteNode(imageNamed: GameConstants.StringConstants.superCoinImageName)
        coin.scale(to: size, width: false, multiplier: 0.15)
        coin.position = CGPoint(x: -coin.size.width / 1.5, y: frame.maxY - size.height * 0.75)
        addChild(coin)
        
        let coinLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        coinLabel.verticalAlignmentMode = .center
        coinLabel.fontSize = 200.0
        coinLabel.text = "\(numberOfCoins)/3"
        coinLabel.scale(to: coin.size, width: false, multiplier: 1.0)
        coinLabel.position = CGPoint(x: coin.size.width / 1.5, y: frame.maxY - size.height * 0.75)
        coinLabel.zPosition = GameConstants.ZPositions.hudZ
        addChild(coinLabel)
        
    }
    
    func animateResult(with achievedScore: CGFloat, and maxScore: CGFloat){
        
        var counter = 0
        let wait = SKAction.wait(forDuration: 0.05)
        let count = SKAction.run {
            counter += 1
            self.scoreLabel.text = String(counter)
            if CGFloat(counter) / maxScore == 0.8 {
                self.animateStar(number: 2)
            }
            else if CGFloat(counter) / maxScore == 0.4 {
                self.animateStar(number: 1)
                }
            else if counter == 1 {
                self.animateStar(number: 0)
            }
        }
        let sequence = SKAction.sequence([wait,count])
        self.run(SKAction.repeat(sequence, count: Int(achievedScore)))
    }
    
    func animateStar(number: Int){
        let star = self[GameConstants.StringConstants.fullStarName + "_\(number)"].first!
        let fadeIn = SKAction.fadeIn(withDuration: 0.1)
        let scaleUp = SKAction.scale(to: 1.2, duration: 0.2)
        let scaleBack = SKAction.scale(to: 1.0, duration: 0.1)
        star.run(SKAction.group([fadeIn,scaleUp,scaleBack]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
