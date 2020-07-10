//
//  SelectCharacterScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SelectCharacterScreen: UIViewController {
    
    // MARK: - Character Selection
    @IBOutlet var imageView: UIImageView!
    var character: UIImage!
    var imageArr = [ UIImage(named: "hamster"),
                     UIImage(named: "bunny"),
                     UIImage(named: "dog"),
                     UIImage(named: "og tama")]
    
    var counter: Int = 0; // for looping of imageArr
    
    @IBAction func didTapNext() {
        if self.counter >= self.imageArr.count - 1 {
            counter = 0
        } else {
            counter += 1
        }
        imageView.image = imageArr[counter]
    }

    @IBAction func didTapPrevious() {
        if self.counter == 0 {
            counter = self.imageArr.count - 1
        } else {
            counter -= 1
        }
        imageView.image = imageArr[counter]
    }
    
    func getCharacter(counter:Int) -> String? {
        if counter == 0 {
            return "hamster"
        } else if counter == 1 {
            return "bunny"
        } else if counter == 2 {
            return "dog"
        } else {
            return "og tama"
        }
    }
    
    // MARK: - Character Naming
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let namingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 23, y: 291, width: 329, height: 66))
        label.text = "NAME YOUR CHARACTER"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Games", size: 23.0)
        label.backgroundColor = .init(displayP3Red: 258, green: 184, blue: 0, alpha: 0.4)
        return label
    }()
    
    let namingTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 23, y: 389, width: 329, height: 34))
        textField.placeholder = "Name"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 158, y: 447, width: 59, height: 36))
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 15.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()

    var characterName: String!

    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSelect(_ sender: Any) {
        view.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.addSubview(namingLabel)
        view.addSubview(namingTextField)
        view.addSubview(doneButton)
    }
    
    @objc func didTapDone() {
        self.character = imageView.image!
        self.characterName = namingTextField.text!
        // add user info to database
        let db = Firestore.firestore()
        
        db.collection("users").document(emailValue!).setData(["characterName": self.characterName!,
                                                              "character":self.getCharacter(counter: counter)!,
                                                              "hunger": 0.5]) { (error) in
            if (error != nil) {
                // do smth but hopefully doesnt happen
            }
        }
        
        // transition to next screen
        let vc = (self.storyboard?.instantiateViewController(identifier: "Successful Pet Creation"))! as SuccessfulPetCreationScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.character
        vc.finalCharacterName = self.characterName
//        vc.email = self.emailValue
        present(vc, animated: true)
    }
    
    // MARK: - Firebase
    var emailValue: String!
}
