//
//  Layer.swift
//  Super Indie Runner
//
//  Created by Bryan on 11/02/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

public func * (point: CGPoint, scalar: CGFloat) -> CGPoint{
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func += (left: inout CGPoint, right: CGPoint) {
    left = left + right
}


class Layer: SKNode {
    
    var layerVelocity = CGPoint.zero
    
    func update(_ delta: TimeInterval) {
        for child in children {
            updateNodesGlobal(delta, childNode: child)
            
        }
    }
    
    func updateNodesGlobal(_ delta : TimeInterval, childNode: SKNode) {
        let offset = layerVelocity * CGFloat(delta)
        childNode.position += offset
        updateNodes(delta, childNode: childNode)
    }
        
    func updateNodes(_ delta: TimeInterval, childNode: SKNode) {
        //Overridden in subclasses
    }
}
