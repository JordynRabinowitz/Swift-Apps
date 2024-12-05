//
//  GameScene.swift
//  Air Hockey
//
//  Created by Rabinowitz, Jordyn on 4/11/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {


    let ball = SKSpriteNode(imageNamed: "ball")
    let player1 = SKSpriteNode(color: .black, size: CGSize(width: 100.0, height: 30.0))
    let computer = SKSpriteNode(color: .black, size: CGSize(width: 200.0, height: 30.0))
    var player1Goal = SKSpriteNode()
    var computerGoal = SKSpriteNode()
   
    let ballMask: UInt32 = 0b1
    let player1Mask: UInt32 = 0b10
    let computerMask: UInt32 = 0b100
    
    let player1GoalMask: UInt32 = 0b1000
    let computerGoalMask: UInt32 = 0b10000
    
    
    var player1ScoreL = 0
    var computerScoreL = 0
    
    let player1Score = SKLabelNode()
    let computerScore = SKLabelNode()
    let winnerLabel = SKLabelNode()
    var winner = ""
    
    
    override func didMove(to view: SKView) {
        player1Goal = SKSpriteNode(color: .clear, size: CGSize(width: view.frame.width - 10, height: 1))
        computerGoal = SKSpriteNode(color: .clear, size: CGSize(width: view.frame.width - 10, height: 1))
    
        player1Goal.position = CGPoint(x: view.frame.midX, y: view.frame.minY + 30.0)
        computerGoal.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 30.0)
        
        addChild(player1Goal)
        addChild(computerGoal)
        
        player1Goal.physicsBody = SKPhysicsBody(rectangleOf: player1Goal.size)
       computerGoal.physicsBody = SKPhysicsBody(rectangleOf: computerGoal.size)
        player1Goal.physicsBody?.isDynamic = false
        computerGoal.physicsBody?.isDynamic = false

        
        
        backgroundColor = .white
        player1Score.text = "0"
        player1Score.fontColor = .black
        player1Score.fontSize = 90
        player1Score.position = CGPoint(x: view.frame.midX, y: view.frame.midY - 150)
        addChild(player1Score)
        
        computerScore.text = "0"
        computerScore.fontColor = .black
        computerScore.fontSize = 90
        computerScore.position = CGPoint(x: view.frame.midX, y: view.frame.midY + 150)
        addChild(computerScore)
        
        
        ball.size = CGSize(width: 40.0, height: 40.0)
       
        player1.position = CGPoint(x: view.frame.midX, y: view.frame.minY + 50.0)
       ball.position = (CGPoint(x: view.frame.midX, y: view.frame.midY))
        computer.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 50.0)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.width / 2)
        player1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100.0, height: 30.0))
        computer.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200.0, height: 30.0))
                                            
        ball.physicsBody?.linearDamping  = 0.0
        ball.physicsBody?.angularDamping = 0.0
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.friction = 0.0
       
        self.physicsWorld.gravity = .zero
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
      addChild(ball)
      addChild(player1)
      addChild(computer)
        
        ball.physicsBody?.categoryBitMask = ballMask
        player1.physicsBody?.categoryBitMask = player1Mask
        computer.physicsBody?.categoryBitMask = computerMask
        player1Goal.physicsBody?.categoryBitMask = player1GoalMask
        computerGoal.physicsBody?.categoryBitMask = computerGoalMask
        
        
        
        ball.physicsBody?.contactTestBitMask = player1GoalMask | computerGoalMask | player1Mask | computerMask
        
        
        player1.physicsBody?.isDynamic = false
        computer.physicsBody?.isDynamic = false
        
        
        
        winnerLabel.fontColor = .white
        winnerLabel.fontSize = 25
        winnerLabel.position = CGPoint(x: view.frame.midX, y: view.frame.midY)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        moveGoalie()
        
        if ((ball.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)) != nil){
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -100))}
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            player1.position.x = touchLocation.x
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        
        if bodyA.node!.physicsBody!.categoryBitMask > bodyB.node!.physicsBody!.categoryBitMask{
            bodyA = contact.bodyB
            bodyB = contact.bodyA
            
        }
        if bodyA.node?.physicsBody?.categoryBitMask == ballMask && bodyB.node?.physicsBody?.categoryBitMask == player1GoalMask {
             computerScoreL += 1
            computerScore.text = "\(computerScoreL)"
        }
        if bodyA.node?.physicsBody?.categoryBitMask == ballMask && bodyB.node?.physicsBody?.categoryBitMask == computerGoalMask {
             player1ScoreL += 1
            player1Score.text = "\(player1ScoreL)"
            
        }
        
        if bodyA.node?.physicsBody?.categoryBitMask == ballMask && bodyB.node?.physicsBody?.categoryBitMask == computerMask{
           
            if let emitterNode = SKEmitterNode(fileNamed: "computer.sks"){
                emitterNode.targetNode = self
                emitterNode.position = contact.contactPoint
                emitterNode.zPosition = 3
                addChild(emitterNode)
            }
        }
        if bodyA.node?.physicsBody?.categoryBitMask == ballMask && bodyB.node?.physicsBody?.categoryBitMask == player1Mask{
           
            if let emitterNode = SKEmitterNode(fileNamed: "player.sks"){
                emitterNode.targetNode = self
                emitterNode.position = contact.contactPoint
                emitterNode.zPosition = 3
                addChild(emitterNode)
            }
        }
        

        
        if  player1ScoreL == 10 || computerScoreL == 10 {
            if(player1ScoreL == 10){winner = "You won!"}
            if(computerScoreL == 10){winner = "You lost, the computer won :("}
            self.removeAllChildren()
            backgroundColor = .purple
            winnerLabel.text = winner
            addChild(winnerLabel)
        }
       
    }
    
    func moveGoalie(){
        
        let slideRight = SKAction.moveTo(x: view!.frame.width - 250, duration: 1)
        let slideLeft = SKAction.moveTo(x: 250, duration: 1)
        let sequence = SKAction.sequence([slideRight, slideLeft])
        let repeater = SKAction.repeatForever(sequence)
        computer.run(repeater)
    
        
    }
    
    
    
  
}
