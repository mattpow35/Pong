//
//  GameOverScene.swift
//  Pong
//
//  Created by Matt Powley on 2/15/17.
//  Copyright © 2017 Matt Powley. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOverScene: SKScene
{
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    private var gameOverLabel : SKLabelNode?
    
    override func didMove(to view: SKView)
    {
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let startSceneTemp = StartScene(fileNamed: "StartScene")
        self.scene?.view?.presentScene(startSceneTemp!, transition: SKTransition.doorsOpenHorizontal(withDuration: 1))
    }
    

    
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
    }
}
