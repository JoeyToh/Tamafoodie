//
//  HungerBarScene.swift
//  Tamafoodie
//
//  Created by Toh Joey on 28/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import SpriteKit
import FirebaseFirestore

class HungerBarScene: SKScene {
    
    let hungerBar: HungerBar = {
        let bar = HungerBar(color: .red, size: CGSize(width: 148, height: 8))
        bar.position = CGPoint(x: -80, y: 504)
        return bar
    }()
    
    let incrementVal: Double = 0.01 // Bar will change by 0.01 everytime
    var counter: Int = 0
    var calories: Int = 0
    var shouldIncrease: Bool = false // True if pet exercised, false if pet ate
    var otherOngoing: Bool = false // True if there is ongoing change in bar due to eating/exercise. When false, bar will automatically increase w time
    
    var progress = 0.0
    var email: String = ""
    
    override func didMove(to view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "floor+wall")
        bg.zPosition = 0
        bg.size = self.size
        self.addChild(bg)
        
        // MARK: - Drawing borders of hunger bar
        let barBorder = SKShapeNode(rectOf: CGSize(width: 150, height: 10), cornerRadius: 5)
        barBorder.position = CGPoint(x: -80, y: 504)
        barBorder.zPosition = 3
        barBorder.strokeColor = .black
        barBorder.lineWidth = 3.5
        self.addChild(barBorder)
        
        let outerBorder = SKShapeNode(rectOf: CGSize(width: 310, height: 100), cornerRadius: 5)
        outerBorder.position = CGPoint(x: -125, y: 530)
        outerBorder.zPosition = 2
        outerBorder.strokeColor = .black
        outerBorder.lineWidth = 7
        self.addChild(outerBorder)
        
        // MARK: - Initialise hunger bar
        // hungerBar.progress = progress
        self.addChild(hungerBar)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if otherOngoing == true {
            if shouldIncrease == true {
                while counter != calories {
                    hungerBar.progress += incrementVal
                    counter += 1
                }
            } else {
                while counter != calories {
                    hungerBar.progress -= incrementVal
                    counter += 1
                }
            }
            calories = 0
            otherOngoing = false
        } else {
            hungerBar.progress += 0.0001
        }
        // progress = hungerBar.progress
        mainVCInstance?.progress = hungerBar.progress
    }
    
}

class HungerBar: SKNode {
    var bar: SKSpriteNode?
    var _progress: Double = 0
    var progress: Double {
        get {
            return _progress
        }
        set {
            let value = max(min(newValue, 1.0), 0.0)
            if let bar = bar {
                bar.xScale = CGFloat(value)
                _progress = value
            }
        }
    }
    
    convenience init(color: SKColor, size: CGSize) {
        self.init()
        bar = SKSpriteNode(color: color, size: size)
        if let bar = bar {
            bar.xScale = 0.0
            bar.zPosition = 4
            bar.position = CGPoint(x: -size.width / 2, y: 0)
            bar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            addChild(bar)
        }
    }
}

