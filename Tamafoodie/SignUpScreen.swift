//
//  SignUpScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class SignUpScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSignUp() {
        let vc = (storyboard?.instantiateViewController(identifier: "Select Character"))! as SelectCharacterScreen
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
