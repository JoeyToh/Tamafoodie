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
    
    // For adjusting zPosition
//    @IBOutlet weak var vetButton: UIButton!
//    @IBOutlet weak var marketButton: UIButton!
//    @IBOutlet weak var gymButton: UIButton!
//    @IBOutlet weak var hungerLabel: UILabel!
//    @IBOutlet weak var clock: UIImageView!
//    @IBOutlet weak var whale: UIImageView!
//    @IBOutlet weak var bg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjusting zPosition of all the layers
        // bg.layer.zPosition = -1
//        clock.layer.zPosition = 1
//        whale.layer.zPosition = 1
//        characterName.layer.zPosition = 2
//        hungerLabel.layer.zPosition = 2
//        character.layer.zPosition = 2
//        vetButton.layer.zPosition = 5
//        marketButton.layer.zPosition = 5
//        gymButton.layer.zPosition = 5
        
        // Data passing
        character.image = finalCharacter
        characterName.text = finalCharacterName
        
        // SpriteKit Hunger Bar scene
        if let scene = HungerBarScene(fileNamed:"GameScene.sks") {
            let skView = self.view as! SKView
            // skView.backgroundColor = .clear
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = false
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }

    @IBAction func didTapVet(_ sender: Any) {
    }
    
    @IBAction func didTapMarket(_ sender: Any) {
    }
    
    @IBAction func didTapGym(_ sender: Any) {
    }
}
