//
//  MainScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    @IBOutlet var character: UIImageView!
    var finalCharacter: UIImage!

    @IBOutlet weak var characterName: UILabel!
    var finalCharacterName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        character.image = finalCharacter
        characterName.text = finalCharacterName
    }

    @IBAction func didTapVet(_ sender: Any) {
    }
    
    @IBAction func didTapMarket(_ sender: Any) {
    }
    
    @IBAction func didTapGym(_ sender: Any) {
    }
}
