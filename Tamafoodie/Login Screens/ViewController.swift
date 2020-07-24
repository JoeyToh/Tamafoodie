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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
                    vc.email = email
                    vc.modalPresentationStyle = .fullScreen
                    vc.finalCharacterName = document?.get("characterName") as? String
                    vc.finalCharacter = UIImage(named: (document?.get("character") as? String)!)
                    vc.finalCharacterType = document?.get("character") as? String
                    vc.accumulatedCalories = document?.get("calories") as! Int
                    vc.wallet = document?.get("wallet") as! Double
                    vc.progress = (document?.get("progress") as! Double) 
                    self.present(vc, animated: true)
                }
            }
        }
    }
}

