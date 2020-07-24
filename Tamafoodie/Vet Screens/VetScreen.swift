//
//  VetScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class VetScreen: UIViewController {
    
    @IBOutlet weak var finalCharacter: UIImageView!
    var character: UIImage!
    var characterName: String!
    
    // Keep track
    var email: String!
    var accumulatedCalories = 0
    var progress = 0.0
    var wallet = 0.0
    
    // MARK: - Health Report
    let whiteBG: UIImageView = {
        let bg = UIImageView()
        bg.backgroundColor = .white
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    let hospital: UILabel = {
        let label = UILabel(frame: CGRect(x: 49, y: 65, width: 276, height: 17))
        label.text = "TAMAFOODIE GENERAL HOSPITAL"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 15.0)
        return label
    }()
    
    let patientLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 115, width: 92, height: 17))
        label.text = "Patient:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 17.0)
        return label
    }()
    
    let testLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 140, width: 209, height: 118))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Test(s): \nHemoglobin A1C \nLipid Panel \nHepatic Panel"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 17.0)
        return label
    }()
    
    let diagnosisLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 275, width: 103, height: 17))
        label.text = "Diagnosis:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 17.0)
        return label
    }()
    
    let healthyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 275, width: 285, height: 240))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Test results show that \npatient has healthy blood \nsugar and cholesterol. \nPatient has 20% lower risk \nof diabetes than average. \n \nAdvice: \nKeep up the good diet and \nfrequent exercises."
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 17.0)
        return label
    }()
    
    let unhealthyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 275, width: 285, height: 300))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Test results show that \npatient has high blood \nsugar and cholesterol. \nPatient has 40% higher risk \nof diabetes than average. \n \nAdvice: \nCut down on sugary and \nprocessed food. \nExercise at least 3 times \na week. \nStart with simple cardio \nexercises like briskwalking \nor slow jogging."
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 17.0)
        return label
    }()
    
    let signature: UIImageView = {
        let s = UIImageView(image: UIImage(named: "Signature"))
        s.frame = CGRect(x: 29, y: 635, width: 125, height: 21)
        return s
    }()
    
    let bottomDetails: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 654, width: 285, height: 76))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Dr. Hamtaro \nDepartment of Pet Health \nTamafoodie General Hospital \nSingapore 169608"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Courier", size: 13.0)
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 167, y: 751, width: 50, height: 30))
        button.setTitle("OKAY", for: .normal)
        button.titleLabel?.font = UIFont(name: "Courier", size: 17.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()
    
    @IBAction func viewHealthReport(_ sender: Any) {
        let patientName: UILabel = {
            let label = UILabel(frame: CGRect(x: 140, y: 115, width: 62, height: 17))
            label.text = self.characterName
            label.textAlignment = .left
            label.textColor = .black
            label.font = UIFont(name: "Courier", size: 17.0)
            return label
        }()
        
        view.addSubview(whiteBG)
        whiteBG.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        whiteBG.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        whiteBG.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        whiteBG.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(hospital)
        view.addSubview(patientLabel)
        view.addSubview(patientName)
        view.addSubview(testLabel)
        view.addSubview(diagnosisLabel)
        view.addSubview(signature)
        view.addSubview(bottomDetails)
        view.addSubview(doneButton)
        
        if accumulatedCalories >= 1500 {
            view.addSubview(unhealthyLabel)
        } else {
            view.addSubview(healthyLabel)
        }
    }
    
    @objc func didTapDone() {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.character
        vc.finalCharacterName = self.characterName
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
    
    
    
    // MARK: - Cure Sickness
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let question: UILabel = {
        let label = UILabel(frame: CGRect(x: 51, y: 327, width: 273, height: 71))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Would you like to use your \nmoney to cure your pet?"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Gameplay", size: 13.0)
        return label
    }()
    
    let yesButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 93, y: 427, width: 57, height: 37))
        button.setTitle("Yes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 17.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapYes), for: .touchDown)
        return button
    }()
    
    let noButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 225, y: 427, width: 57, height: 37))
        button.setTitle("No", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 17.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()
    
    let notEnoughMoneyMsg: UILabel = {
        let label = UILabel(frame: CGRect(x: 26, y: 309, width: 273, height: 118))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "You do not have enough money ! \nUse other ways to make your \npet healthy \nHint: Hit the gym :)"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Gameplay", size: 15.0)
        return label
    }()
    
    let notEnoughMoneyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 159, y: 420, width: 57, height: 37))
        button.setTitle("OKAY", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 17.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()
    
    let enoughMoneyMsg: UILabel = {
        let label = UILabel(frame: CGRect(x: 26, y: 309, width: 323, height: 118))
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Yay ! Your pet is healthy again. \nContinue to exercise and eat \nhealthily to maintain your pet's \n health"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Gameplay", size: 15.0)
        return label
    }()
    
    let enoughMoneyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 159, y: 420, width: 57, height: 37))
        button.setTitle("OKAY", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 17.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(enoughMoney), for: .touchDown)
        return button
    }()
    
    @objc func didTapYes() {
        question.removeFromSuperview()
        yesButton.removeFromSuperview()
        noButton.removeFromSuperview()
        
        if wallet >= 20 {
            view.addSubview(enoughMoneyMsg)
            view.addSubview(enoughMoneyButton)
        } else {
            view.addSubview(notEnoughMoneyMsg)
            view.addSubview(notEnoughMoneyButton)
        }
    }
    
    @objc func enoughMoney() {
        wallet -= 20
        self.accumulatedCalories = 0
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.character
        vc.finalCharacterName = self.characterName
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
    
    @IBAction func cureSickness(_ sender: Any) {
        view.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(question)
        view.addSubview(yesButton)
        view.addSubview(noButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        finalCharacter.image = character
    }
    
    // MARK: - Others
    @IBAction func didTapBack(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.character
        vc.finalCharacterName = self.characterName
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
    
}
