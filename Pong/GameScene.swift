//
//  GameScene.swift
//  Pong
//
//  Created by Matt Powley on 12/7/16.
//  Copyright © 2016 Matt Powley. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    var pongBall = SKSpriteNode()
    var enemyPaddle = SKSpriteNode()
    var userPaddle = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        pongBall = self.childNode(withName: "pongBall") as! SKSpriteNode
        enemyPaddle = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        userPaddle = self.childNode(withName: "userPaddle") as! SKSpriteNode
        
        pongBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: -20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
    
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        
    
    }
}
