import UIKit
import SpriteKit
import PlaygroundSupport

public class Form : SKScene {
    
    var bgImage : SKSpriteNode!
    var rectangle : SKShapeNode!
    
    var heading : SKLabelNode!
    
    var budgetLabel : SKLabelNode!
    var minusBudget : SKLabelNode!
    var budgetNumber : SKLabelNode!
    var plusBudget : SKLabelNode!

    var milesDailyLabel : SKLabelNode!
    var minusMiles : SKLabelNode!
    var milesNumber : SKLabelNode!
    var plusMiles : SKLabelNode!
    
    var seatsLabel : SKLabelNode!
    var minusSeats : SKLabelNode!
    var seatsNumber : SKLabelNode!
    var plusSeats : SKLabelNode!
    
    var nextButton : SKLabelNode!
    
    var circleMinusBudget : SKShapeNode!
    var circlePlusBudget : SKShapeNode!
    
    var imageView2 : UIImageView!
    var image2 : SKSpriteNode!
    
    
    var seats = 5
    var miles = 50
    var budget = 50000

    
    public override func didMove(to view: SKView) {
        bgImage = SKSpriteNode(imageNamed: "bgimage.png")
        bgImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        bgImage.size = CGSize(width: 500, height: 500)
        bgImage.alpha = 1.0
        self.addChild(bgImage)
        
        var rectangle2 = SKShapeNode(rect: CGRect(x: self.size.width/2, y: self.size.height/2, width: 500, height: 500))
        rectangle2.fillColor = .white
        rectangle2.alpha = 0.7
        self.addChild(rectangle2)
        
        
        rectangle = SKShapeNode(rect: CGRect(x: 200, y: 350, width: 400, height: 250), cornerRadius: 4)
        rectangle.fillColor = .white
        rectangle.alpha = 0.7
        rectangle.position = CGPoint(x: -150, y: -150)
        self.addChild(rectangle)
        
        
        heading = SKLabelNode(text: "Find your dream")
        heading.position = CGPoint(x: 200, y: 400)
        heading.fontColor = SKColor.black
        heading.fontName = "HelveticaNueue-Bold"
        heading.fontSize = 22.0
        self.addChild(heading)
        
        
        let image = SKSpriteNode(imageNamed: "model x")
        image.position = CGPoint(x: 335, y: 410)
        image.size = CGSize(width: 100, height: 57.415)
        self.addChild(image)
        
        
        image2 = SKSpriteNode(imageNamed: "wheel")
        image2.position = CGPoint(x: 305.5, y: 402)
        image2.size = CGSize(width: 17.165, height: 16.415)
        self.addChild(image2)
        
        
        
        let image3 = SKSpriteNode(imageNamed: "wheel right")
        image3.position = CGPoint(x: 365, y: 402)
        image3.size = CGSize(width: 32.5/2, height: 16)
        self.addChild(image3)
        
        var action = SKAction.rotate(byAngle: 1, duration: 0.1)
        action = SKAction.repeatForever(action)
        image2.run(action)
        image3.run(action)
        
        
        
        budgetLabel = SKLabelNode(text: "Budget")
        budgetLabel.position = CGPoint(x: 180, y: 350)
        budgetLabel.fontColor = SKColor.black
        budgetLabel.fontName = "HelveticaNueue-Bold"
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        circleMinusBudget = SKShapeNode(circleOfRadius: 10)
        circleMinusBudget.position = CGPoint(x: 280, y: 357)
        circleMinusBudget.fillColor = SKColor.black
        self.addChild(circleMinusBudget)
        
        minusBudget = SKLabelNode(text: "-")
        minusBudget.position = CGPoint(x: 280, y: 351)
        minusBudget.name = "minusBudget"
        minusBudget.fontName = "HelveticaNueue-Bold"
        minusBudget.fontColor = SKColor.white
        minusBudget.fontSize = 20.0
        self.addChild(minusBudget)

        budgetNumber = SKLabelNode(text: String(budget))
        budgetNumber.position = CGPoint(x: 330, y: 350)
        budgetNumber.fontColor = SKColor.black
        budgetNumber.fontSize = 20
        self.addChild(budgetNumber)
        
        circlePlusBudget = SKShapeNode(circleOfRadius: 10)
        circlePlusBudget.position = CGPoint(x: 380, y: 357)
        circlePlusBudget.fillColor = SKColor.black
        self.addChild(circlePlusBudget)
        
        plusBudget = SKLabelNode(text: "+")
        plusBudget.position = CGPoint(x: 380, y: 351)
        plusBudget.name = "plusBudget"
        plusBudget.fontName = "HelveticaNueue-Bold"
        plusBudget.fontColor = SKColor.white
        plusBudget.fontSize = 20
        self.addChild(plusBudget)
        
        
        
        milesDailyLabel = SKLabelNode(text: "Daily Miles")
        milesDailyLabel.position = CGPoint(x: 180, y: 300)
        milesDailyLabel.fontColor = SKColor.black
        milesDailyLabel.fontName = "HelveticaNueue-Bold"
        milesDailyLabel.fontSize = 18.0
        self.addChild(milesDailyLabel)
        
        minusMiles = SKLabelNode(text: "-")
        minusMiles.position = CGPoint(x: 280, y: 300)
        minusMiles.name = "minusMiles"
        minusMiles.fontName = "HelveticaNueue-Bold"
        minusMiles.fontColor = SKColor.black
        minusMiles.fontSize = 20.0
        self.addChild(minusMiles)
        
        milesNumber = SKLabelNode(text: String(miles))
        milesNumber.position = CGPoint(x: 330, y: 300)
        milesNumber.fontColor = SKColor.black
        milesNumber.fontSize = 20
        self.addChild(milesNumber)
        
        plusMiles = SKLabelNode(text: "+")
        plusMiles.position = CGPoint(x: 380, y: 300)
        plusMiles.name = "plusMiles"
        plusMiles.fontName = "HelveticaNueue-Bold"
        plusMiles.fontColor = SKColor.black
        plusMiles.fontSize = 20
        self.addChild(plusMiles)
        
        
        
        seatsLabel = SKLabelNode(text: "Seats")
        seatsLabel.position = CGPoint(x: 185, y: 250)
        seatsLabel.fontColor = SKColor.black
        seatsLabel.fontName = "HelveticaNueue-Bold"
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        minusSeats = SKLabelNode(text: "-")
        minusSeats.position = CGPoint(x: 280, y: 250)
        minusSeats.name = "minusSeats"
        minusSeats.fontName = "HelveticaNueue-Bold"
        minusSeats.fontColor = SKColor.black
        minusSeats.fontSize = 20.0
        self.addChild(minusSeats)
        
        seatsNumber = SKLabelNode(text: String(seats))
        seatsNumber.position = CGPoint(x: 330, y: 250)
        seatsNumber.fontColor = SKColor.black
        seatsNumber.fontSize = 20
        self.addChild(seatsNumber)
        
        plusSeats = SKLabelNode(text: "+")
        plusSeats.position = CGPoint(x: 380, y: 250)
        plusSeats.name = "plusSeats"
        plusSeats.fontName = "HelveticaNueue-Bold"
        plusSeats.fontColor = SKColor.black
        plusSeats.fontSize = 20
        self.addChild(plusSeats)
        
        
        
        nextButton = SKLabelNode(text: "Next")
        nextButton.position = CGPoint(x: 380, y: 180)
        nextButton.name = "next"
        nextButton.fontColor = SKColor.black
        nextButton.fontSize = 18.0
        self.addChild(nextButton)
        
    }
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "minusBudget" && budget > 30000 {
                budget = budget - 5000
                self.budgetNumber.text = String(budget)

            }
            else if name == "plusBudget" && budget < 150000 {
                budget = budget + 5000
                self.budgetNumber.text = String(budget)
            }
            
            else if name == "minusMiles" && miles > 0 {
                miles = miles - 5
                self.milesNumber.text = String(miles)
            }
            else if name == "plusMiles" && miles < 350 {
                miles = miles + 5
                self.milesNumber.text = String(miles)
            }
            
            else if name == "minusSeats" && seats > 4 {
                seats = seats - 1
                self.seatsNumber.text = String(seats)
            }
            else if name == "plusSeats" && seats < 7 {
                seats = seats + 1
                self.seatsNumber.text = String(seats)
            }
            
            else if name == "next" {
                
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


let scene = Form(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
