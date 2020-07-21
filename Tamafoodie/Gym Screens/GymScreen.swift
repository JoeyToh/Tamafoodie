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
    
    @IBAction func backTapped(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.Character
        vc.finalCharacterName = self.CharacterName
        // i removed the cal part cus if we were to go back there should be any changes to calories right?
        vc.otherOngoing = true
        vc.shouldIncrease = false
        present(vc, animated: true)
    }
}
