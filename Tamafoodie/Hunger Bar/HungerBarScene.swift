//
//  HungerBarScene.swift
//  Tamafoodie
//
//  Created by Toh Joey on 28/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import SpriteKit

class HungerBarScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .white
        
        // Hunger Bar
        let barBorder = SKShapeNode(rectOf: CGSize(width: 150, height: 10), cornerRadius: 5)
        barBorder.position = CGPoint(x: -98, y: 505)
        barBorder.zPosition = 3
        barBorder.strokeColor = .black
        barBorder.lineWidth = 2
        self.addChild(barBorder)
        
        hungerBar.progress = 1.0
        self.addChild(hungerBar)
        
        let outerBorder = SKShapeNode(rectOf: CGSize(width: 310, height: 100), cornerRadius: 5)
        outerBorder.position = CGPoint(x: -140, y: 530)
        outerBorder.zPosition = 2
//        outerBorder.fillColor = .init(displayP3Red: 255, green: 198, blue: 17, alpha: 1)
//        outerBorder.strokeColor = .init(displayP3Red: 107, green: 68, blue: 22, alpha: 1)
        outerBorder.strokeColor = .brown
        //outerBorder.fillColor = .orange
        outerBorder.lineWidth = 7
        self.addChild(outerBorder)
        
        
    }
    
    let hungerBar: HungerBar = {
        let bar = HungerBar(color: .red, size: CGSize(width: 150, height: 8))
        bar.position = CGPoint(x: -98, y: 505)
        return bar
    }()
    
    public var didTouchScreen: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didTouchScreen = true
    }
    
    let incrementVal = CGFloat(0.01)
    var incrementCount = 0
    
    override func update(_ currentTime: TimeInterval) {
        if didTouchScreen == true {
            if incrementCount != 25 {
                hungerBar.progress -= incrementVal
                incrementCount += 1
            } else {
                incrementCount = 0
                didTouchScreen = false
            }
        }
    }
}

class HungerBar: SKNode {
    var bar: SKSpriteNode?
    var _progress: CGFloat = 0
    var progress: CGFloat {
        get {
            return _progress
        }
        set {
            let value = max(min(newValue, 1.0), 0.0)
            if let bar = bar {
                bar.xScale = value
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

