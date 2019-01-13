//
//  MainMenuButton.swift
//  NiceCars
//
//  Created by Németh László Harri on 2019. 01. 11..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuButton: SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.size = CGSize.init(width: 600.0, height: 200.0)
        self.color = SKColor.white
        
        let innerNode = SKSpriteNode(
            texture: SKTexture.init(image: UIImage(named: "BMWLogo")!),
            color:   SKColor.clear,
            size:    CGSize.init(width: 200.0, height: 200.0)
        )
        innerNode.zPosition = 2

        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        effectNode.addChild(SKSpriteNode(
            texture: self.texture,
            color:   self.color,
            size:    self.size
        ))
        effectNode.zPosition = 1
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius":50])
        effectNode.alpha = 0.7
        self.addChild(effectNode)
        self.addChild(innerNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

