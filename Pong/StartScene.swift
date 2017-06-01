//
//  StartScene.swift
//  Pong
//
//  Created by Matt Powley on 2/15/17.
//  Copyright © 2017 Matt Powley. All rights reserved.
//

import GameplayKit
import UIKit
import SpriteKit



class StartScene : SKScene
{
   
    
    override func didMove(to view: SKView)
    {
        super.didMove(to: view)
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        goToGameScreen()
    }
    
    func goToGameScreen()
    {
        let gameSceneTemp = GameScene(fileNamed: "GameScene")
        
        
        self.scene?.view?.presentScene(gameSceneTemp!, transition: SKTransition.doorsOpenHorizontal(withDuration: 0))
    }
}
