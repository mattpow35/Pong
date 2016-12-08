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
    
    var score = [Int]()
    
    override func didMove(to view: SKView)
    {
        startGame()
        
        pongBall = self.childNode(withName: "pongBall") as! SKSpriteNode
        enemyPaddle = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        userPaddle = self.childNode(withName: "userPaddle") as! SKSpriteNode
        
        pongBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: -20))

        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    func startGame()
    {
        score = [0,0]
    }
    
    func addScore(winningPlayer : SKSpriteNode)
    {
        pongBall.position = CGPoint(x: 0, y: 0)
        pongBall.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if winningPlayer == userPaddle
        {
            score[0] += 1
            pongBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else if winningPlayer == enemyPaddle
        {
            score[1] += 1
            pongBall.physicsBody?.applyImpulse(CGVector(dx: 20, dy: -20))
        }
        print(score)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            userPaddle.run(SKAction .moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            userPaddle.run(SKAction .moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        
        enemyPaddle.run(SKAction .moveTo(x: pongBall.position.x, duration: 1.0))
    
        if pongBall.position.y <= userPaddle.position.y - 70
        {
            addScore(winningPlayer : enemyPaddle)
        }
        else if pongBall.position.y >= enemyPaddle.position.y + 70
        {
            addScore(winningPlayer : userPaddle)
        }
    }
}
