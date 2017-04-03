import UIKit
import SpriteKit
import PlaygroundSupport

public class Home : SKScene {
    var bgImage : SKSpriteNode!
    var fader : SKShapeNode!
    
    var textLabel : SKLabelNode!
    var earthImage : SKSpriteNode!
    var frames: [SKTexture] = []
    var blackCover : SKShapeNode!
    
    var timer : Timer!
    var timer2 : Timer!

    var object : SKSpriteNode!
    var object2 : SKSpriteNode!
    
    var circle : UIBezierPath!
    var circularMove : SKAction!
    
    var switchLabel : SKLabelNode!

    public override func didMove(to view: SKView) {

        circle = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 300, height: 300), cornerRadius: 150)
        circularMove = SKAction.follow(circle.cgPath, asOffset: false, orientToPath: true, duration: 5)
        
        object = SKSpriteNode(imageNamed: "hummer.png")
        object.size = CGSize(width: 80, height: 133)
        object.run(SKAction.repeatForever(circularMove.reversed()))
        
        bgImage = SKSpriteNode(imageNamed: "blurred.png")
        bgImage.position = CGPoint(x: 250, y: 250)
        bgImage.size = CGSize(width: 500, height: 500)
        self.addChild(bgImage)
        
        fader = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 500, height: 500))
        fader.fillColor = .white
        fader.alpha = 0.35
        self.addChild(fader)
        
        textLabel = SKLabelNode(text: "Gas cars have been ruining our environment")
        textLabel.position = CGPoint(x: 250, y: 450)
        textLabel.fontColor = .black
        textLabel.fontSize = 16.0
        textLabel.horizontalAlignmentMode = .center
        textLabel.fontName = "Arial"
        self.addChild(textLabel)
        
        addAllEarth()
        
        earthImage = SKSpriteNode(imageNamed: "frame_0_delay-0.1s.gif")
        earthImage.position = CGPoint(x: 250, y: 250)
        earthImage.size = CGSize(width: 300, height: 300)
        
        let animation = SKAction.animate(with: frames, timePerFrame: 0.15)
        earthImage.run(SKAction.repeatForever(animation))
        
        self.addChild(earthImage)
        
        blackCover = SKShapeNode(circleOfRadius: 137)
        blackCover.fillColor = .black
        blackCover.strokeColor = .black
        blackCover.position = CGPoint(x: 250, y: 250)
        blackCover.alpha = 0
        self.addChild(blackCover)
        
        self.addChild(object)
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(Home.darkerEarth), userInfo: nil, repeats: true)
        
        object2 = SKSpriteNode(imageNamed: "model x.png")
        object2.size = CGSize(width: 80, height: 133)
        object2.run(SKAction.repeatForever(circularMove.reversed()))
    }
    func darkerEarth() {
        if(blackCover.alpha < 0.8) {
            blackCover.alpha = blackCover.alpha + 0.05
        }
        else {
            object.removeAllActions()
            object.removeFromParent()
            
            timer.invalidate()
            self.addChild(object2)
            timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(Home.lighterEarth), userInfo: nil, repeats: true)
            textLabel.text = "So we need to switch to electric cars to save our Earth!"
        }
    }
    func lighterEarth() {
        if(blackCover.alpha > 0) {
            blackCover.alpha = blackCover.alpha - 0.05
        }
        else {
            timer2.invalidate()
            object2.removeAllActions()
            object2.removeFromParent()
            earthImage.removeAllActions()
            earthImage.removeFromParent()
            textLabel.removeFromParent()
            
            switchLabel = SKLabelNode(text: "Customize your dream electric car now!")
            switchLabel.fontName = "HelveticaNeue-Bold"
            switchLabel.fontColor = .black
            switchLabel.fontSize = 25.0
            switchLabel.position = CGPoint(x: 250, y: 250)
            switchLabel.horizontalAlignmentMode = .center
            self.addChild(switchLabel)
            
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(Home.lighterEarth), userInfo: nil, repeats: false)
        }
    }
    func loadForm() {
//        let scene = Form()
//        scene.size = size
//        scene.scaleMode = scaleMode
//        let transition = SKTransition.fade(withDuration: 1)
//        self.view?.presentScene(scene, transition: transition)
    }
    
    func addAllEarth() {
        for x in 0...43 {
            let f = SKTexture.init(imageNamed: "frame_" + String(x) + "_delay-0.1s.gif")
            frames.append(f)
        }
    }
}

let frame = CGRect(x: 0, y: 0, width: 500, height: 500)

let skView = SKView(frame: frame)
skView.showsDrawCount = true
skView.showsNodeCount = true
skView.showsFPS = true
skView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]


let scene = Home(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
