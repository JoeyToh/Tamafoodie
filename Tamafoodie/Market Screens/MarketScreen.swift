//
//  MarketScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class MarketScreen: UIViewController {
    
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
            //let cal = arr[1]
            let oneBtn: UIButton = {
                let button = UIButton()
                button.setTitle(food as? String, for: .normal)
                button.setTitleColor(UIColor.black, for: .normal)
                button.widthAnchor.constraint(equalToConstant: 280).isActive = true
                button.backgroundColor = UIColor.init(red: 247, green: 184, blue: 49, alpha: 1)
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                button.tag = int
                return button
            }()
            
            //oneView.addSubview(oneBtn)
            buttonStack.addArrangedSubview(oneBtn)
        }
    }
    
    @IBAction func buttonAction(sender: UIButton!) {
        let vc = (self.storyboard?.instantiateViewController(identifier: "Main Screen"))! as MainScreen
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.finalCharacter = UIImage(named: "hamster")
        vc.finalCharacterName = "Hammie"
        present(vc, animated: true)
        
        // can code whatever is needed to be done with the button
        // make use the calories etc?
        print("\(sender.tag)")
    }
}
