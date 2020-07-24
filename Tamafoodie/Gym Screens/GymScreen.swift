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
    
    var run = true
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var characterView: UIImageView!
    
    var dogRunImages: [UIImage] = [UIImage(named: "dog run 1")!, UIImage(named: "dog run 2")!]
    var dogLiftImages: [UIImage] = [UIImage(named: "dog weightlift 1")!, UIImage(named: "dog weightlift 2")!]
    
    override func viewDidLoad() {
        characterView.image = self.Character
        gifView.isHidden = true
        super.viewDidLoad()
    }
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 23, y: 155, width: 329, height: 66))
        label.textAlignment = .center
        label.textColor = .black
        label.text = "How far would you like to run?"
        label.font = UIFont(name: "Gameplay", size: 15.0)
        label.backgroundColor = .init(displayP3Red: 258, green: 184, blue: 0, alpha: 0.4)
        return label
    }()
    
    let disclaimerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 3, y: 220, width: 368, height: 38))
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Calories are calculated using average speed of 7km/min."
        label.font = UIFont(name: "Helvetica Neue", size: 14.0)
        label.backgroundColor = .init(displayP3Red: 258, green: 184, blue: 0, alpha: 0.4)
        return label
    }()
    
    let textFieldView: UITextField = {
        let view = UITextField(frame: CGRect(x: 139, y: 299, width: 97, height: 34))
        return view
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 164, y: 610, width: 59, height: 36))
        button.setTitle("Okay", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 15.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()
    
    @objc func didTapDone() {
        characterView.isHidden = true
        if run {
           gifView.animationImages = dogRunImages
           gifView.animationDuration = 1
           gifView.startAnimating()
           gifView.isHidden = false
        } else {
            gifView.animationImages = dogLiftImages
            gifView.animationDuration = 1
            gifView.startAnimating()
            gifView.isHidden = false
        }
       }
    
    @IBAction func runTapped(_ sender: Any) {
        self.run = true
        
        view.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.addSubview(questionLabel)
        view.addSubview(disclaimerLabel)
        view.addSubview(textFieldView)
        view.addSubview(doneButton)
    }
    
    @IBAction func liftTapped(_ sender: Any) {
        self.run = false
        
        view.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.addSubview(questionLabel)
        view.addSubview(disclaimerLabel)
        view.addSubview(textFieldView)
        view.addSubview(doneButton)
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
