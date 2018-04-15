//
//  HUDDelegate.swift
//  Super Indie Runner
//
//  Created by Bryan on 15/04/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import Foundation


protocol HUDDelegate {
    
    func updateCoinLabel(coins :Int)

    
    func addSuperCoin(index: Int)
    
}
