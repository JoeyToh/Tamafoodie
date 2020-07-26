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
    var CharacterType: String!

    var calories = 0 // no. of calories of food just eaten
    var hunger = 0 // to change hunger bar
    
    // Data passing
    var email: String!
    var accumulatedCalories = 0 // passed from main screen
    var wallet = 0.0
    var progress = 0.0
    
    @IBOutlet weak var buttonStack: UIStackView!
    var foodArray = [
        ["Apple", 83, "One medium apple", "No variations"],
        ["Cake", 327, "One slice", "Chocolate cake: 537 \nIce cream cake: 240 \nPound cake: 215 \nTiramisu cake: 314"],
        ["Fried egg", 173, "One egg", "No variations"],
        ["Fruit juice", 111, "One cup (240 ml)", "Apple juice: 110 \nBanana juice: 120 \nCoconut water: 46 \nLemonade: 120 \nMango lassi: 158"],
        ["Hamburger", 495, "One burger", "Big Mac: 522 \nDouble Cheeseburger: 440 \nMcSpicy: 522"],
        ["Noodles", 185, "Varies", "Egg noodles: 146 \nGlass noodles: 108 \nMacaroni: 422 \nRavioli: 43 \nSpaghetti: 207"],
        ["Onigiri", 212, "One onigiri", "Tuna onigiri: 232 \nSalmon Onigiri: 191"],
        ["Pancakes", 93, "One pancake (5 inches across)", "Plain pancake: 93 \nPancake with syrup: 145"],
        ["Pie", 289, "One slice", "Apple pie: 296 \nBluberry pie: 290 \nChocolate mousse pie: 247 \nPumpkin pie: 323"],
        ["Pizza", 301, "One slice", "Cheese: 272 \nHawaiian: 294 \nMeat: 400 \nVeggie: 260"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(displayP3Red: 135/255, green: 206/255, blue: 242/255, alpha: 1)
        
        for (int, arr) in foodArray.enumerated() {
            
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
        let label = UILabel(frame: CGRect(x: 23, y: 141, width: 329, height: 66))
        //label.text = ""
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Games", size: 23.0)
        label.backgroundColor = .init(displayP3Red: 258, green: 184, blue: 0, alpha: 0.4)
        return label
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 93, y: 232, width: 200, height: 200))
        return view
    }()
    
    let textView: UITextView = {
        let view = UITextView(frame: CGRect(x: 41, y: 457, width: 303, height: 128))
        view.backgroundColor = UIColor.clear
        view.allowsEditingTextAttributes = false
        view.isSelectable = false
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
        // transition to next screen
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = self.Character
        vc.finalCharacterName = self.CharacterName
        vc.finalCharacterType = self.CharacterType
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
        calorieLabel.text = String(describing: self.foodArray[sender.tag][1])
        imageView.image = UIImage(named: String(describing: self.foodArray[sender.tag][0]))!
        // split text
        textView.text = String(describing: self.foodArray[sender.tag][3])
        view.addSubview(calorieLabel)
        view.addSubview(imageView)
        view.addSubview(textView)
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
        vc.finalCharacterType = self.CharacterType
        vc.email = self.email!
        vc.accumulatedCalories = self.accumulatedCalories
        vc.progress = self.progress
        vc.wallet = self.wallet
        present(vc, animated: true)
    }
}
