//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Jenny Kim on 6/28/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import SpriteKit

class SushiPiece: SKSpriteNode {/* Sushi type */
    var side: Side = .None {
        
        didSet {
            switch side {
            case .Left:
                /* Show left chopstick */
                leftChopstick.hidden = false
            case .Right:
                /* Show right chopstick */
                rightChopstick.hidden = false
            case .None:
                /* Hide all chopsticks */
                leftChopstick.hidden = true
                rightChopstick.hidden = true
            }
            
        }
    }
    
    
    /* Chopsticks objects */
    var rightChopstick: SKSpriteNode!
    var leftChopstick: SKSpriteNode!
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func connectChopsticks() {
        /* Connect the child chopstick nodes */
        
        rightChopstick = childNodeWithName("rightChopstick") as! SKSpriteNode
        leftChopstick = childNodeWithName("leftChopstick") as! SKSpriteNode
        
        /* Set the default side */
        side = .None
    }
    
    
    func flip(side: Side) {
        /* Flip the sushi out of the screen */
        
        var actionName: String = ""
        
        if side == .Left {
            actionName = "FlipRight"
        } else if side == .Right {
            actionName = "FlipLeft"
        }
        
        /* Load appropriate action */
        let flip = SKAction(named: actionName)!
        
        /* Create a node removal action */
        let remove = SKAction.removeFromParent()
        
        /* Build sequence, flip then remove from scene */
        let sequence = SKAction.sequence([flip,remove])
        runAction(sequence)
    }
    
}