//
//  SuccessfulPetCreationScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import Firebase

class SuccessfulPetCreationScreen: UIViewController {

    @IBOutlet weak var characterName: UILabel!
    var finalCharacterName: String!
    var finalTest: String!
    @IBOutlet weak var character: UIImageView!
    var finalCharacter: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterName.text = finalCharacterName!
        character.image = finalCharacter!
    }
    
    @IBAction func didTapOkay(_ sender: Any) {
//        let db = Firestore.firestore()
//        let progress = db.collection("users").document(email!)
    
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.finalCharacter = self.finalCharacter
        vc.finalCharacterName = self.finalCharacterName
        present(vc, animated: true)
    }
    
    // MARK: - Firebase
//    var email: String!
}
