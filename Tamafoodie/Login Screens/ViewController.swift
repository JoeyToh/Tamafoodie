//
//  ViewController.swift
//  Tamafoodie
//
//  Created by Toh Joey on 17/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

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
                let h = self.storyboard?.instantiateViewController(identifier: "Main Screen") as? MainScreen
                self.view.window?.rootViewController = h
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}

