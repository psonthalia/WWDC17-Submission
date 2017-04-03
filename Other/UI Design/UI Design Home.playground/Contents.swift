import UIKit
import SpriteKit
import PlaygroundSupport

public class Home : SKScene {
    
    var label : SKLabelNode!
    var heading : SKLabelNode!
    var imageView2 : UIImageView!
    var image2 : SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        
        self.backgroundColor = .white
        
        heading = SKLabelNode(text: "Find the perfect electric vehicle for you!")
        heading.position = CGPoint(x: self.size.width/2, y: 400)
        heading.fontColor = SKColor.black
        heading.fontSize = 20.0
        self.addChild(heading)
        
        label = SKLabelNode(text: "Start")
        label.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        label.name = "pineapple"
        label.fontColor = SKColor.black
        label.fontSize = 26.0
        self.addChild(label)
        
        let image = SKSpriteNode(imageNamed: "model x")
        image.position = CGPoint(x: 200, y: 400)
        image.size = CGSize(width: 200.0, height: 114.83)
        self.addChild(image)
        
        
        image2 = SKSpriteNode(imageNamed: "wheel")
        image2.position = CGPoint(x: 138, y: 382)
        image2.size = CGSize(width: 34.33, height: 32.83)
        self.addChild(image2)
        
        
        
        let image3 = SKSpriteNode(imageNamed: "wheel right")
        image3.position = CGPoint(x: 259, y: 382)
        image3.size = CGSize(width: 32.5, height: 32.0)
        self.addChild(image3)
        
        var action = SKAction.rotate(byAngle: 1, duration: 0.1)
        action = SKAction.repeatForever(action)
        image2.run(action)
        image3.run(action)
        
        
        
    }
    func rotate() {
        image2.zRotation = 3.14/10.0
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "pineapple"
            {
                print("Touched")
//                let scene = Form()
//                scene.size = size
//                scene.scaleMode = scaleMode
//                let transition = SKTransition.fade(withDuration: 1)
//                self.view?.presentScene(scene, transition: transition)
            }
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