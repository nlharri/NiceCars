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
        self.color = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

