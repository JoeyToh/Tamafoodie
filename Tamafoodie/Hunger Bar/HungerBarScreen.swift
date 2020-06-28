//
//  HungerBarScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 28/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit
import SpriteKit

class HungerBarScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = HungerBarScene(fileNamed:"GameScene.sks") {
            let skView = self.view as! SKView
            // skView.frame = CGRect(x: 0, y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = false
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
}


class HungerBarScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .white
        
        // Hunger Bar
        
        let barBorder = SKShapeNode(rectOf: CGSize(width: 150, height: 10), cornerRadius: 5)
        barBorder.position = CGPoint(x: 0, y: 400)
        barBorder.zPosition = 2
        barBorder.strokeColor = .black
        barBorder.lineWidth = 2
        self.addChild(barBorder)
        
        hungerBar.progress = 1.0
        self.addChild(hungerBar)
        
    }
    
    let hungerBar: HungerBar = {
        let bar = HungerBar(color: .red, size: CGSize(width: 150, height: 8))
        bar.position = CGPoint(x: 0, y: 400)
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
            bar.zPosition = 2
            bar.position = CGPoint(x: -size.width / 2, y: 0)
            bar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            addChild(bar)
        }
    }
}
