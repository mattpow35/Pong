//
//  StartScene.swift
//  Pong
//
//  Created by Matt Powley on 1/21/17.
//  Copyright © 2017 Matt Powley. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var startButton = SKSpriteNode()
    var button : SKNode! = nil
    
    override func didMove(to view: SKView)
    {
        startButton = self.childNode(withName: "startButton") as! SKSpriteNode
        startButton.position.y = 50
        startButton.position.x = -50
        self.addChild(startButton)
        
        
        // Create a simple red rectangle that's 100x44
        button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 100, height: 44))
        // Put it in the center of the scene
        button.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
    
        self.addChild(button)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if startButton.contains(location)
            {
                
            
            print("touched")
                
            let gameSceneTemp = GameScene(fileNamed: "GameScene")
            self.scene?.view?.presentScene(gameSceneTemp!, transition: SKTransition.crossFade(withDuration: 1.0))
            }
        }
    
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if startButton.contains(location)
            {
                
                
                print("touched")
                
                let gameSceneTemp = GameScene(fileNamed: "GameScene")
                self.scene?.view?.presentScene(gameSceneTemp!, transition: SKTransition.crossFade(withDuration: 1.0))
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
