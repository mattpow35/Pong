//
//  GameOver.swift
//  Pong
//
//  Created by Matt Powley on 1/21/17.
//  Copyright © 2017 Matt Powley. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver : GKState
{
    unowned let scene : GameScene
    
    init(scene : SKScene)
    {
        self.scene = scene as! GameScene
        super.init()
    }
//    
//    override func didEnter(from previousState: GKState?) {
//        <#code#>
//    }
//    
//    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
//        return stateClass is TapToPlay.Type
//    }
    
}
