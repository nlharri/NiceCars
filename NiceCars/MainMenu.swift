//
//  MainMenu.swift
//  NiceCars
//
//  Created by Németh László Harri on 2019. 01. 11..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenu: SKScene {
    
    private var niceCarsLabel: SKLabelNode?
    private var niceCarsLogoWithLabel: SKNode?
    private var carSilhouetteNode: SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.niceCarsLogoWithLabel = self.childNode(withName: "//NiceCarsLogoWithLabel")
        self.niceCarsLabel = self.childNode(withName: "//NiceCarsLabel") as? SKLabelNode
        self.carSilhouetteNode = SKShapeNode.init(rectOf: CGSize.init(width: 100, height: 100))
        if let logoWithLabel = self.niceCarsLogoWithLabel,
            let _ = self.niceCarsLabel, // just to be sure it is there
            let carSilhouetteNode = self.carSilhouetteNode {
            // init car silhouette logo
            carSilhouetteNode.position.x = -170
            carSilhouetteNode.position.y = 0
            carSilhouetteNode.setScale(CGFloat(1.0))
            carSilhouetteNode.lineWidth = 0
            carSilhouetteNode.fillColor = SKColor.white
            carSilhouetteNode.fillTexture = SKTexture.init(image: UIImage(named: "CarSilhouette")!)
            logoWithLabel.addChild(carSilhouetteNode)
            
            logoWithLabel.alpha = 0.0
            logoWithLabel.setScale(0.0)
            
            let fadeInAction = SKAction.fadeIn(withDuration: 0.7)
            let scaleAction = SKAction.scale(to: 1.0, duration: 0.7)
            logoWithLabel.run(SKAction.group([fadeInAction,
                                              scaleAction]))
        }
    }
}

