//
//  GameScene.swift
//  NiceCars
//
//  Created by Németh László Harri on 2019. 01. 07..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var animDelay : Int {
        return 5 // for testing purposes
    }
    
    private var label : SKLabelNode?
    private var carSilhouetteNode : SKShapeNode?
    //private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//NICECarsLabel") as? SKLabelNode
        self.carSilhouetteNode = SKShapeNode.init(rectOf: CGSize.init(width: 100, height: 100))
        if let label = self.label,
           let carSilhouetteNode = self.carSilhouetteNode {
            
            // init car silhouette logo
            carSilhouetteNode.position.x = 0
            carSilhouetteNode.position.y = 480
            carSilhouetteNode.setScale(CGFloat(2.5))
            carSilhouetteNode.lineWidth = 0
            carSilhouetteNode.fillColor = SKColor.white
            carSilhouetteNode.fillTexture = SKTexture.init(image: UIImage(named: "CarSilhouette")!)
            self.addChild(carSilhouetteNode)
            carSilhouetteNode.alpha = 0.0
            
            // Init label
            label.alpha = 0.0
            
            // init actions
            let fadeInAction = SKAction.fadeIn(withDuration: 2.0)
            let moveToCenterAction = SKAction.moveBy(x: 0, y: -320, duration: 2.0)
            let waitAction = SKAction.wait(forDuration: 2.0)
            let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
            let moveToBottomAction = SKAction.moveBy(x: 0, y: -320, duration: 1.0)
            
            let fadeInAndMoveToCenterAction = SKAction.group([fadeInAction,
                                                      moveToCenterAction])
            let fadeOutAndMoveToBottomAction = SKAction.group([fadeOutAction,
                                                               moveToBottomAction])
            
            // build init animation action
            let initAnimationAction = SKAction.sequence([fadeInAndMoveToCenterAction,
                                                         waitAction,
                                                         fadeOutAndMoveToBottomAction])
            
            // set action for both the logo and the label
            carSilhouetteNode.run(initAnimationAction)
            label.run(initAnimationAction)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(animDelay), execute: {
                if let mainMenuScene = SKScene(fileNamed: "MainMenu") {
                    mainMenuScene.scaleMode = .aspectFill
                    //let reveal = SKTransition.reveal(with: .down, duration: 1.0)
                    let flipHorizontal = SKTransition.flipVertical(withDuration: 0.7)
                    if let mainView = self.view {
                        mainView.presentScene(mainMenuScene, transition: flipHorizontal)
                    }
                }
            })
        }

        /*
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }*/
        /*
        if let carSilhouetteNode = self.carSilhouetteNode {
            carSilhouetteNode.position.x = 0
            carSilhouetteNode.position.y = 480
            carSilhouetteNode.setScale(CGFloat(2.5))
            carSilhouetteNode.lineWidth = 0
            carSilhouetteNode.fillColor = SKColor.white
            carSilhouetteNode.fillTexture = SKTexture.init(image: UIImage(named: "CarSilhouette")!)
            self.addChild(carSilhouetteNode)
            carSilhouetteNode.alpha = 0.0
            carSilhouetteNode.run(SKAction.fadeIn(withDuration: 2.0))
        }*/
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
/*        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }*/
    }
    
    func touchMoved(toPoint pos : CGPoint) {
/*        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }*/
    }
    
    func touchUp(atPoint pos : CGPoint) {
/*        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }*/
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
/*        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }*/
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
