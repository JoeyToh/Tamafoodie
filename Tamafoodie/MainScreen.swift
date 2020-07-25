//
//  MainScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import SpriteKit
import FirebaseFirestore

class MainScreen: UIViewController {
    
    @IBOutlet var character: UIImageView!
    var finalCharacter: UIImage!

    @IBOutlet weak var characterName: UILabel!
    var finalCharacterName: String!
    
    var finalCharacterType: String!
    
    var email: String!
    
    // Keep track
    var progress = 0.0
    var accumulatedCalories = 0
    var wallet = 0.0
    
    // For passing of data
    var calories = 0
    var otherOngoing: Bool = false
    var shouldIncrease: Bool = false
    
    @IBOutlet weak var walletLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainVCInstance = self
        
        wallet += 0.1
        walletLabel.text = "\(Int(wallet))"
        
        // Data passing
        if self.accumulatedCalories < 1000 {
            if finalCharacterType == "hamster" {
                finalCharacter = UIImage(named: "hamster")
                print("ham")
            } else if finalCharacterType == "bunny" {
                finalCharacter = UIImage(named: "bunny")
            } else if finalCharacterType == "dog" {
                finalCharacter = UIImage(named: "dog")
            } else if finalCharacterType == "og tama" {
                finalCharacter = UIImage(named: "og tama")
            } else {
                // error
            }
        } else {
            if finalCharacterType == "hamster" {
                finalCharacter = UIImage(named: "fat hamster")
                print("fat")
            } else if finalCharacterType == "bunny" {
                finalCharacter = UIImage(named: "bunny")
            } else if finalCharacterType == "dog" {
                finalCharacter = UIImage(named: "fat dog")
            } else if finalCharacterType == "og tama" {
                finalCharacter = UIImage(named: "fat og tama")
            } else {
                // error
            }
        }
        
        character.image = finalCharacter
        characterName.text = finalCharacterName
        
        // SpriteKit Hunger Bar scene
        if let scene = HungerBarScene(fileNamed:"GameScene.sks") {
            scene.backgroundColor = .clear
            scene.email = self.email!
            scene.hungerBar.progress = self.progress
            scene.calories = self.calories
            scene.progress = progress
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
        let vet = (self.storyboard?.instantiateViewController(identifier: "Vet Screen"))! as VetScreen
        vet.modalPresentationStyle = .fullScreen
        vet.characterName = self.finalCharacterName
        vet.character = self.finalCharacter
        vet.email = self.email!
        vet.accumulatedCalories = self.accumulatedCalories
        vet.wallet = self.wallet
        vet.progress = self.progress
        self.present(vet, animated: true)
    }
    
    @IBAction func tapMarket(_ sender: Any) {
        let mkt = (self.storyboard?.instantiateViewController(identifier: "Market Screen"))! as MarketScreen
        mkt.modalPresentationStyle = .fullScreen
        mkt.CharacterName = self.finalCharacterName
        mkt.Character = self.finalCharacter
        mkt.email = self.email!
        mkt.accumulatedCalories = self.accumulatedCalories
        mkt.wallet = self.wallet
        mkt.progress = self.progress
        self.present(mkt, animated: true)
    }
    
    @IBAction func tapGym(_ sender: Any) {
        let gym = (self.storyboard?.instantiateViewController(identifier: "Gym Screen"))! as GymScreen
        gym.modalPresentationStyle = .fullScreen
        gym.CharacterName = self.finalCharacterName
        gym.Character = self.finalCharacter
        gym.CharacterType = self.finalCharacterType
        gym.email = self.email!
        gym.accumulatedCalories = self.accumulatedCalories
        gym.wallet = self.wallet
        gym.progress = self.progress
        self.present(gym, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("users").document(email).setData(["calories": accumulatedCalories, "wallet": wallet, "progress": progress], merge: true)
    }
}

weak var mainVCInstance = MainScreen()
