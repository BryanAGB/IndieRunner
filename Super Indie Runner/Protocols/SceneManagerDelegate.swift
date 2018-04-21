//
//  SceneManagerDelegate.swift
//  Super Indie Runner
//
//  Created by Bryan Mansell on 21/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import Foundation

protocol SceneManagerDelegate {
    
    func presentLevelScene(for world: Int)
    func presentGameScene(for level: Int, in world: Int)
    func presentMenuScene()
}
