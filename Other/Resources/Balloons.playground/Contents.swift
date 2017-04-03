// Requires Xcode 6 (beta 4) running on Yosemite (developer preview 4) or later.
import SpriteKit
import XCPlayground

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 850, height: 638))
let scene = SKScene(fileNamed: "GameScene")
scene?.scaleMode = .aspectFill
sceneView.presentScene(scene)

XCPShowView(identifier: "Balloons", view: sceneView)


let images = [
    "blue", "heart-blue", "star-blue",
    "green", "star-green", "heart-pink",
    "heart-red", "orange", "red",
    "star-gold", "star-pink", "star-red",
    "yellow"
]
let textures: [SKTexture] = images.map { SKTexture(imageNamed: "balloon-\($0)") }

var configureBalloonPhysics: ((_ balloon: SKSpriteNode) -> Void)?
func createRandomBalloon() -> SKSpriteNode {
    let choice = Int(arc4random_uniform(UInt32(textures.count)))
    var balloon = SKSpriteNode(texture: textures[choice])
    configureBalloonPhysics?(balloon)
    
    return balloon
}


let BalloonCategory: UInt32 = 1 << 1
configureBalloonPhysics = { balloon in
    balloon.physicsBody = SKPhysicsBody(texture: balloon.texture!, size: balloon.size)
    balloon.physicsBody!.linearDamping = 0.5
    balloon.physicsBody!.mass = 0.1
    balloon.physicsBody!.categoryBitMask = BalloonCategory
    balloon.physicsBody!.contactTestBitMask = BalloonCategory
}

let displayBalloon: (SKSpriteNode, SKNode) -> Void = { balloon, cannon in
    let pointzero = CGPoint(x: 0, y: 0)
    balloon.position = cannon.childNode(withName: "mouth")!.convert(pointzero, to: scene!)
    scene?.addChild(balloon)
}

let fireBalloon: (SKSpriteNode, SKNode) -> Void = { balloon, cannon in
    let impulseMagnitude: CGFloat = 70.0
    
    let xComponent = cos(cannon.zRotation) * impulseMagnitude
    let yComponent = sin(cannon.zRotation) * impulseMagnitude
    let impulseVector = CGVector(dx: xComponent, dy: yComponent)
    
    balloon.physicsBody!.applyImpulse(impulseVector)
}

func fireCannon(cannon: SKNode) {
    let balloon = createRandomBalloon()
    
    displayBalloon(balloon, cannon)
    fireBalloon(balloon, cannon)
}

let leftBalloonCannon = scene?.childNode(withName: "//left_cannon")!
let rightBalloonCannon = scene?.childNode(withName: "//right_cannon")!

let wait = SKAction.wait(forDuration: 1.0, withRange: 0.05)
let pause = SKAction.wait(forDuration: 0.55, withRange: 0.05)

let left = SKAction.run { fireCannon(cannon: leftBalloonCannon!) }
let right = SKAction.run { fireCannon(cannon: rightBalloonCannon!) }

let leftFire = SKAction.sequence([wait, left, pause, left, pause, left, wait])
let rightFire = SKAction.sequence([pause, right, pause, right, pause, right, wait])


leftBalloonCannon?.run(SKAction.repeatForever(leftFire))
rightBalloonCannon?.run(SKAction.repeatForever(rightFire))

let balloonPop = (1...4).map {
    SKTexture(imageNamed: "explode_0\($0)")
}

let removeBalloonAction: SKAction = SKAction.sequence([
    SKAction.animate(with: balloonPop, timePerFrame: 1 / 30.0),
    SKAction.removeFromParent()
    ])


let GroundCategory: UInt32 = 1 << 2
let ground = scene?.childNode(withName: "//ground")!
ground?.physicsBody!.categoryBitMask = GroundCategory


class PhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
    func didBeginContact(contact: SKPhysicsContact) {
        let categoryA = contact.bodyA.categoryBitMask
        let categoryB = contact.bodyB.categoryBitMask
        
        if (categoryA & BalloonCategory != 0) && (categoryB & BalloonCategory != 0) {
            contact.bodyA.node!.run(removeBalloonAction)
        }
    }
}

let contactDelegate = PhysicsContactDelegate()
scene?.physicsWorld.contactDelegate = contactDelegate