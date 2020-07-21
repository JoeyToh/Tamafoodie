//
//  MainScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import SpriteKit

class MainScreen: UIViewController {
    
    @IBOutlet var character: UIImageView!
    var finalCharacter: UIImage!

    @IBOutlet weak var characterName: UILabel!
    var finalCharacterName: String!
    
    var finalCharacterType: String!
    
    var progress = 0
    var calories = 0
    var otherOngoing: Bool = false
    var shouldIncrease: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data passing
        character.image = finalCharacter
        characterName.text = finalCharacterName
        
        // SpriteKit Hunger Bar scene
        if let scene = HungerBarScene(fileNamed:"GameScene.sks") {
            scene.backgroundColor = .clear
            scene.calories = self.calories
            scene.otherOngoing = self.otherOngoing
            scene.shouldIncrease = self.shouldIncrease
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = false
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }

    @IBAction func tapVet(_ sender: Any) {
    }
    
    @IBAction func tapMarket(_ sender: Any) {
        let mkt = (self.storyboard?.instantiateViewController(identifier: "Market Screen"))! as MarketScreen
        mkt.modalPresentationStyle = .fullScreen
        mkt.CharacterName = self.finalCharacterName
        mkt.Character = self.finalCharacter
        self.present(mkt, animated: true)
    }
    
    @IBAction func tapGym(_ sender: Any) {
        let gym = (self.storyboard?.instantiateViewController(identifier: "Gym Screen"))! as GymScreen
        gym.modalPresentationStyle = .fullScreen
        gym.CharacterName = self.finalCharacterName
        gym.Character = self.finalCharacter
        gym.CharacterType = self.finalCharacterType
        self.present(gym, animated: true)
    }
}
