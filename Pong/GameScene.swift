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
    var endlessScore = SKLabelNode()
    var onePlayerScore = [Int]()
    var isGameOver = false
    

    
    
    override func didMove(to view: SKView)
    {
        
        endlessScore = self.childNode(withName: "endlessScore") as! SKLabelNode
        endlessScore.position.x = 0
        endlessScore.position.y = 0
     
            
        pongBall = self.childNode(withName: "pongBall") as! SKSpriteNode
        enemyPaddle = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        enemyPaddle.position.y = (self.frame.height / 2) - 50
        
        
        userPaddle = self.childNode(withName: "userPaddle") as! SKSpriteNode
        userPaddle.position.y = (-self.frame.height / 2) + 50
        
        
        
       

        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        
        
        
   
        
        startGame()
        
    }
    
    func startGame()
    {
        
        onePlayerScore = [0]
        
        endlessScore.text = "\(onePlayerScore[0])"
        
        
    
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.pongBall.physicsBody?.applyImpulse(CGVector(dx: 12, dy: -12))
        }
        
        
    }
    
    
    func randomFloat(from: CGFloat, to: CGFloat) -> CGFloat
    {
        let rand: CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        return (rand) * (to - from) + from
    }

    
    func addScore(winningPlayer : SKSpriteNode)
    {
        pongBall.position = CGPoint(x: 0, y: 0)
        pongBall.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if winningPlayer == userPaddle
        {

            
            onePlayerScore[0] += 1
            
            if(onePlayerScore[0] % 2 == 1)
            {
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when)
                {
                    self.pongBall.physicsBody?.applyImpulse(CGVector(dx: -12, dy: -12))
                }
            }
            else
            {
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when)
                {
                    self.pongBall.physicsBody?.applyImpulse(CGVector(dx: 12, dy: -12))
                }
            }
            
            
        }
        else if winningPlayer == enemyPaddle
        {
            onePlayerScore[0] = 0
            
           let gameOverSceneTemp = GameOverScene(fileNamed: "GameOverScene")
            self.scene?.view?.presentScene(gameOverSceneTemp!, transition: SKTransition.doorsOpenHorizontal(withDuration: 1))
        }
        
        endlessScore.text = "\(onePlayerScore[0])"
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
        
        switch currentDifficulty
        {
        case .easy:
            enemyPaddle.run(SKAction .moveTo(x: pongBall.position.x, duration: 1.0))
            break
        case .medium:
            enemyPaddle.run(SKAction .moveTo(x: pongBall.position.x, duration: 0.75))
            break
        case .hard:
            enemyPaddle.run(SKAction .moveTo(x: pongBall.position.x, duration: 0.5))
            break
        
        }
        
        
    
        if pongBall.position.y <= userPaddle.position.y - 30
        {
            addScore(winningPlayer : enemyPaddle)
            
            
        }
        else if pongBall.position.y >= enemyPaddle.position.y + 30
        {
            addScore(winningPlayer : userPaddle)
        }
    }
    
}
