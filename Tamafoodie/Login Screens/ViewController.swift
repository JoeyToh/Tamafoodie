//
//  ViewController.swift
//  Tamafoodie
//
//  Created by Toh Joey on 17/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var charName: String?
    var char: String?
    
    @IBAction func loginTapped(_ sender: Any) {
        // add cleaned up fields
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pw = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // sign in user
        Auth.auth().signIn(withEmail: email, password: pw) { (result, error) in
            if error != nil {
                // display error message
                self.errorLabel.text = error!.localizedDescription
            } else {
                // set up animal
                let db = Firestore.firestore()
                let doc = db.collection("users").document(email)                
                doc.getDocument { (document, error) in
                    // transition to screen
                    let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
                    vc.modalPresentationStyle = .fullScreen
                    vc.finalCharacterName = document?.get("characterName") as? String
                    vc.finalCharacter = UIImage(named: (document?.get("character") as? String)!)
                    self.present(vc, animated: true)
                }
            }
        }
    }
}

