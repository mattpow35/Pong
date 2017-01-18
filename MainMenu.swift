//
//  MainMenu.swift
//  Pong
//
//  Created by Matt Powley on 1/17/17.
//  Copyright © 2017 Matt Powley. All rights reserved.
//

import Foundation
import UIKit

enum gameDifficulty {
    case easy
    case medium
    case hard
}

class MainMenu : UIViewController
{
    
    @IBAction func easy(_ sender: Any)
    {
        goToGameScreen(Game: .easy)
    }
    
    
    @IBAction func medium(_ sender: Any)
    {
        goToGameScreen(Game: .medium)
    }
    
    
    @IBAction func hard(_ sender: Any)
    {
        goToGameScreen(Game: .hard)
    }
    
    func goToGameScreen(Game : gameDifficulty)
    {
        let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        
        currentDifficulty = Game
        
        self.navigationController?.pushViewController(gameViewController, animated: true)
    }
}
