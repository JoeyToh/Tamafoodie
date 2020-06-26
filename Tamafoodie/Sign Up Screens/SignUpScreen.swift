//
//  SignUpScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpScreen: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pw = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // check all fields are filled in
        if (email == "" || pw == "") {
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    @IBAction func didTapSignUp() {
        // add cleaned up fields
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pw = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // validate field
        let error = validateFields()
        if (error != nil) {
            errorLabel.text = error!
        } else {
        // create user
            Auth.auth().createUser(withEmail: email, password: pw) { (result, err) in
                self.UID = result?.user.uid
            // check for errors
                if (err != nil) {
                    self.errorLabel.text = err!.localizedDescription
                } else {
                    // transition to home screen
                    let vc = (self.storyboard?.instantiateViewController(identifier: "Select Character"))! as SelectCharacterScreen
                    vc.UIDValue = self.UID
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .coverVertical
                    self.present(vc, animated: true)
                }
            }
        }
    }
    
    var UID: String!
    
    

}
