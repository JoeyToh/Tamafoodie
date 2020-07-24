//
//  MarketScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class MarketScreen: UIViewController {
    var Character: UIImage!
    var CharacterName: String!

    var calories = 0 // no. of calories of food just eaten
    var hunger = 0 // to change hunger bar
    
    // Data passing
    var email: String!
    var accumulatedCalories = 0 // passed from main screen
    var wallet = 0.0
    var progress = 0.0
    
    @IBOutlet weak var buttonStack: UIStackView!
    var foodArray = [
        ["Egg, fried", 173],
        ["Egg, hard-boiled", 78],
        ["Donair /  Gyro", 310],
        ["Egg roll", 113],
        ["French fries", 236],
        ["Garlic bread", 192],
        ["Hamburger", 275],
        ["Hot-dog, plain", 242],
        ["Milk shake, chocolate", 223],
        ["Milk shake, vanilla", 195]
    ]
    var numArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 206/255, blue: 242/255, alpha: 1)
        
        for int in 0...20 {
            numArray.append("button \(int)")
        }
        
        for (int, arr) in foodArray.enumerated() {
            /*let oneView: UIView = {
                let v = UIView()
                //v.backgroundColor = UIColor.init(red: 106, green: 209, blue: 248, alpha: 1)
                v.backgroundColor = UIColor.red
                return v
            }()*/
            
            let food = arr[0]
            let oneBtn: UIButton = {
                let button = UIButton()
                button.setTitle(food as? String, for: .normal)
                button.setTitleColor(UIColor.black, for: .normal)
                button.widthAnchor.constraint(equalToConstant: 280).isActive = true
                button.backgroundColor = UIColor.init(red: 247, green: 184, blue: 49, alpha: 1)
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1
                button.addTarget(self, action: #selector(buttonAction), for: .touchDown)
                button.tag = int
                return button
            }()
            
            //oneView.addSubview(oneBtn)
            buttonStack.addArrangedSubview(oneBtn)
        }
    }
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let calorieLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 23, y: 291, width: 329, height: 66))
        //label.text = ""
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Games", size: 23.0)
        label.backgroundColor = .init(displayP3Red: 258, green: 184, blue: 0, alpha: 0.4)
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 158, y: 447, width: 59, height: 36))
        button.setTitle("Okay", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gameplay", size: 15.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .init(displayP3Red: 246/255, green: 186/255, blue: 49/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapDone), for: .touchDown)
        return button
    }()
    
     @objc func didTapDone() {
        // transition to next screen
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.Character
        vc.finalCharacterName = self.CharacterName
        vc.calories = hunger
        vc.otherOngoing = true
        vc.shouldIncrease = false
        
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
    
    @IBAction func buttonAction(sender: UIButton!) {
        view.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        calorieLabel.text = String(describing: self.foodArray[sender.tag][1]) //self.foodArray[sender.tag][1] as! String
        view.addSubview(calorieLabel)
        view.addSubview(doneButton)
        calories = self.foodArray[sender.tag][1] as! Int
        self.accumulatedCalories += calories
        hunger = calories / 10 // divide by 10 to make calories more proportional to hunger bar length
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.Character
        vc.finalCharacterName = self.CharacterName
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
}
