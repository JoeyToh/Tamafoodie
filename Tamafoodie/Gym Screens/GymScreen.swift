//
//  GymScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class GymScreen: UIViewController {
    var Character: UIImage!
    var CharacterName:  String!
    var CharacterType: String!
    
    var calories = 0 // no. of calories burnt
    var hunger = 0 // to change hunger bar
    
    // Data passing
    var email: String!
    var accumulatedCalories = 0
    var progress = 0.0
    var wallet = 0.0
    
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var characterView: UIImageView!
    
    var dogRunImages: [UIImage] = [UIImage(named: "dog run 1")!, UIImage(named: "dog run 2")!]
    var dogLiftImages: [UIImage] = [UIImage(named: "dog weightlift 1")!, UIImage(named: "dog weightlift 2")!]
    
    override func viewDidLoad() {
        characterView.image = self.Character
        gifView.isHidden = true
        super.viewDidLoad()
    }
    
    @IBAction func runTapped(_ sender: Any) {
        characterView.isHidden = true
        gifView.animationImages = dogRunImages
        gifView.animationDuration = 1
        gifView.startAnimating()
        gifView.isHidden = false
    }

    @IBAction func liftTapped(_ sender: Any) {
        characterView.isHidden = true
        gifView.animationImages = dogLiftImages
        gifView.animationDuration = 1
        gifView.startAnimating()
        gifView.isHidden = false
    }
    
    // To put after each exercise is done (can refer to market screen as to where to dump this code)
    /*
     self.calories = ? // just help to update amt of calories burnt here
     self.accumulatedCalories -= calories
     hunger = calories / 5 // can adjust denominator to make hunger increase more proportionately
     */
    
    
    // Done button
    /*
     vc.calories = hunger
     vc.otherOngoing = true
     vc.shouldIncrease = true
     
     vc.email = self.email!
     vc.accumulatedCalories = self.accumulatedCalories
     vc.progress = self.progress
     vc.wallet = self.wallet
     */
    
    @IBAction func backTapped(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.Character
        vc.finalCharacterName = self.CharacterName
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
}
