import UIKit
import SpriteKit
import PlaygroundSupport

//: These are the global variables that contain all of the user's parameters
var milesGlobal = 50
var seatsGlobal = 5
var budgetGlobal = 50000

//: This class is the initial form scene
open class First : SKScene {
    
    var bgImage : SKSpriteNode!
    var rectangle : SKShapeNode!
    
    var heading : SKLabelNode!
    
    var budgetLabel : SKLabelNode!
    var minusBudget : SKLabelNode!
    var budgetNumber : SKLabelNode!
    var plusBudget : SKLabelNode!
    var circleMinusBudget : SKShapeNode!
    var circlePlusBudget : SKShapeNode!
    
    var milesDailyLabel : SKLabelNode!
    var minusMiles : SKLabelNode!
    var milesNumber : SKLabelNode!
    var plusMiles : SKLabelNode!
    var circleMinusMiles : SKShapeNode!
    var circlePlusMiles : SKShapeNode!
    
    var seatsLabel : SKLabelNode!
    var minusSeats : SKLabelNode!
    var seatsNumber : SKLabelNode!
    var plusSeats : SKLabelNode!
    var circleMinusSeats : SKShapeNode!
    var circlePlusSeats : SKShapeNode!
    
    var nextButton : SKLabelNode!
    var nextBg : SKShapeNode!
    
    var imageView2 : UIImageView!
    var image2 : SKSpriteNode!
    
    var seats = seatsGlobal
    var miles = milesGlobal
    var budget = budgetGlobal
    
    var loadedFirst = false
    
    open override func didMove(to view: SKView) {
        
        if(loadedFirst == false) {
            let scene = Home()
            scene.size = self.size
            scene.scaleMode = self.scaleMode
            let transition = SKTransition.fade(withDuration: 1)
            self.view?.presentScene(scene, transition: transition)
            loadedFirst = true
        }
        else {
        
            //: Over here I am adding the elements that are needed to the SKScene
            bgImage = SKSpriteNode(imageNamed: "bgimage.png")
            bgImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            bgImage.size = CGSize(width: 700, height: 540)
            bgImage.alpha = 1.0
            self.addChild(bgImage)
            
            let rectangle2 = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 700, height: 540))
            rectangle2.fillColor = .white
            rectangle2.alpha = 0.4
            self.addChild(rectangle2)
            
            
            rectangle = SKShapeNode(rect: CGRect(x: 300, y: 350, width: 400, height: 250), cornerRadius: 4)
            rectangle.fillColor = .white
            rectangle.alpha = 0.8
            rectangle.position = CGPoint(x: -150, y: -150)
            self.addChild(rectangle)
            
            
            heading = SKLabelNode(text: "Find your dream")
            heading.position = CGPoint(x: 300, y: 400)
            heading.fontColor = .darkGray
            heading.fontName = "HelveticaNeue-Bold"
            heading.fontSize = 22.0
            self.addChild(heading)
            
            
            let image = SKSpriteNode(imageNamed: "model x")
            image.position = CGPoint(x: 440, y: 410)
            image.size = CGSize(width: 100, height: 57.415)
            self.addChild(image)
            
            
            image2 = SKSpriteNode(imageNamed: "wheel")
            image2.position = CGPoint(x: 410.5, y: 402)
            image2.size = CGSize(width: 17.165, height: 16.415)
            self.addChild(image2)
            
            
            
            let image3 = SKSpriteNode(imageNamed: "wheel right")
            image3.position = CGPoint(x: 470, y: 402)
            image3.size = CGSize(width: 32.5/2, height: 16)
            self.addChild(image3)
            
            //: This is the animation that makes the wheels on the car spin
            var action = SKAction.rotate(byAngle: 1, duration: 0.1)
            action = SKAction.repeatForever(action)
            image2.run(action)
            image3.run(action)
            
            
            
            budgetLabel = SKLabelNode(text: "Budget")
            budgetLabel.position = CGPoint(x: 280, y: 350)
            budgetLabel.fontColor = .darkGray
            budgetLabel.fontName = "HelveticaNeue-Bold"
            budgetLabel.fontSize = 18.0
            self.addChild(budgetLabel)
            
            circleMinusBudget = SKShapeNode(circleOfRadius: 10)
            circleMinusBudget.position = CGPoint(x: 380, y: 357)
            circleMinusBudget.fillColor = .darkGray
            circleMinusBudget.name = "minusBudget"
            self.addChild(circleMinusBudget)
            
            minusBudget = SKLabelNode(text: "-")
            minusBudget.position = CGPoint(x: 380, y: 351)
            minusBudget.name = "minusBudget"
            minusBudget.fontName = "HelveticaNeue-Bold"
            minusBudget.fontColor = .white
            minusBudget.fontSize = 20.0
            self.addChild(minusBudget)
            
            let inte = budget
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            budgetNumber = SKLabelNode(text: "$" + String(numberFormatter.string(from: NSNumber(value: inte))!))
            budgetNumber.position = CGPoint(x: 430, y: 350)
            budgetNumber.fontColor = .darkGray
            budgetNumber.fontName = "HelveticaNeue-Bold"
            budgetNumber.fontSize = 20
            self.addChild(budgetNumber)
            
            circlePlusBudget = SKShapeNode(circleOfRadius: 10)
            circlePlusBudget.position = CGPoint(x: 480, y: 357)
            circlePlusBudget.fillColor = .darkGray
            circlePlusBudget.name = "plusBudget"
            self.addChild(circlePlusBudget)
            
            plusBudget = SKLabelNode(text: "+")
            plusBudget.position = CGPoint(x: 480, y: 351)
            plusBudget.name = "plusBudget"
            plusBudget.fontName = "HelveticaNeue-Bold"
            plusBudget.fontColor = .white
            plusBudget.fontSize = 20
            self.addChild(plusBudget)
            
            
            
            milesDailyLabel = SKLabelNode(text: "Daily Miles")
            milesDailyLabel.position = CGPoint(x: 280, y: 300)
            milesDailyLabel.fontColor = .darkGray
            milesDailyLabel.fontName = "HelveticaNeue-Bold"
            milesDailyLabel.fontSize = 18.0
            self.addChild(milesDailyLabel)
            
            circleMinusMiles = SKShapeNode(circleOfRadius: 10)
            circleMinusMiles.position = CGPoint(x: 380, y: 306)
            circleMinusMiles.fillColor = .darkGray
            circleMinusMiles.name = "minusMiles"
            self.addChild(circleMinusMiles)
            
            minusMiles = SKLabelNode(text: "-")
            minusMiles.position = CGPoint(x: 380, y: 300)
            minusMiles.name = "minusMiles"
            minusMiles.fontName = "HelveticaNeue-Bold"
            minusMiles.fontColor = .white
            minusMiles.fontSize = 20.0
            self.addChild(minusMiles)
            
            milesNumber = SKLabelNode(text: String(miles))
            milesNumber.position = CGPoint(x: 430, y: 300)
            milesNumber.fontName = "HelveticaNeue-Bold"
            milesNumber.fontColor = .darkGray
            milesNumber.fontSize = 20
            self.addChild(milesNumber)
            
            circlePlusMiles = SKShapeNode(circleOfRadius: 10)
            circlePlusMiles.position = CGPoint(x: 480, y: 307)
            circlePlusMiles.fillColor = .darkGray
            circlePlusMiles.name = "plusMiles"
            self.addChild(circlePlusMiles)
            
            plusMiles = SKLabelNode(text: "+")
            plusMiles.position = CGPoint(x: 480, y: 300)
            plusMiles.name = "plusMiles"
            plusMiles.fontName = "HelveticaNeue-Bold"
            plusMiles.fontColor = .white
            plusMiles.fontSize = 20
            self.addChild(plusMiles)
            
            
            
            seatsLabel = SKLabelNode(text: "Seats")
            seatsLabel.position = CGPoint(x: 285, y: 250)
            seatsLabel.fontColor = .darkGray
            seatsLabel.fontName = "HelveticaNeue-Bold"
            seatsLabel.fontSize = 18.0
            self.addChild(seatsLabel)
            
            circleMinusSeats = SKShapeNode(circleOfRadius: 10)
            circleMinusSeats.position = CGPoint(x: 380, y: 256)
            circleMinusSeats.fillColor = .darkGray
            circleMinusSeats.name = "minusSeats"
            self.addChild(circleMinusSeats)
            
            minusSeats = SKLabelNode(text: "-")
            minusSeats.position = CGPoint(x: 380, y: 250)
            minusSeats.name = "minusSeats"
            minusSeats.fontName = "HelveticaNeue-Bold"
            minusSeats.fontColor = .white
            minusSeats.fontSize = 20.0
            self.addChild(minusSeats)
            
            seatsNumber = SKLabelNode(text: String(seats))
            seatsNumber.position = CGPoint(x: 430, y: 250)
            seatsNumber.fontName = "HelveticaNeue-Bold"
            seatsNumber.fontColor = .darkGray
            seatsNumber.fontSize = 20
            self.addChild(seatsNumber)
            
            circlePlusSeats = SKShapeNode(circleOfRadius: 10)
            circlePlusSeats.position = CGPoint(x: 480, y: 257)
            circlePlusSeats.fillColor = .darkGray
            circlePlusSeats.name = "plusSeats"
            self.addChild(circlePlusSeats)
            
            plusSeats = SKLabelNode(text: "+")
            plusSeats.position = CGPoint(x: 480, y: 250)
            plusSeats.name = "plusSeats"
            plusSeats.fontName = "HelveticaNeue-Bold"
            plusSeats.fontColor = .white
            plusSeats.fontSize = 20
            self.addChild(plusSeats)
            
            nextBg = SKShapeNode(rect: CGRect(x: 455, y: 207, width: 50, height: 20), cornerRadius: 2)
            nextBg.fillColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
            nextBg.strokeColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
            nextBg.name = "next"
            self.addChild(nextBg)
            
            nextButton = SKLabelNode(text: "Next")
            nextButton.position = CGPoint(x: 480, y: 210)
            nextButton.name = "next"
            nextButton.fontColor = .white
            nextButton.fontName = "HelveticaNeue-Bold"
            nextButton.fontSize = 18.0
            self.addChild(nextButton)
        }
        
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        //: This is where I am checking the clicks on all of the buttons
        if let name = touchedNode.name
        {
            if name == "minusBudget" && budget > 30000 {
                budget = budget - 5000
                let inte = budget
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = NumberFormatter.Style.decimal
                
                self.budgetNumber.text = "$" + String(String(numberFormatter.string(from: NSNumber(value: inte))!))
                
            }
            else if name == "plusBudget" && budget < 150000 {
                budget = budget + 5000
                let inte = budget
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = NumberFormatter.Style.decimal
                
                self.budgetNumber.text = "$" + String(String(numberFormatter.string(from: NSNumber(value: inte))!))
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
                //: This is where I load the Results scene
                var act : UIActivityIndicatorView!
                DispatchQueue.main.async {
                    act = UIActivityIndicatorView(frame: CGRect(x: self.size.width/2 - 10, y: self.size.height/2 - 40, width: 10, height: 10))
                    act.color = .blue
                    act.startAnimating()
                    self.view?.bringSubview(toFront: act)
                    self.view?.addSubview(act)
                    
                    DispatchQueue.main.async {
                        milesGlobal = self.miles
                        seatsGlobal = self.seats
                        budgetGlobal = self.budget
                        
                        let scene = Results()
                        scene.size = self.size
                        scene.scaleMode = self.scaleMode
                        let transition = SKTransition.fade(withDuration: 1)
                        self.view?.presentScene(scene, transition: transition)
                        act.removeFromSuperview()
                    }
                }
            }
        }
    }
}




//: This class is the main landing screen and it has the initial animation
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
    
    var cloud1 : SKSpriteNode!
    var cloud2 : SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        
        //: Over here I am adding all of the necessary elements into the SKScene
        
        circle = UIBezierPath(roundedRect: CGRect(x: 200, y: 100, width: 300, height: 300), cornerRadius: 150)
        circularMove = SKAction.follow(circle.cgPath, asOffset: false, orientToPath: true, duration: 5.5)
        
        
        object = SKSpriteNode(imageNamed: "hummer.png")
        object.size = CGSize(width: 80, height: 133)
        
        object2 = SKSpriteNode(imageNamed: "model x side.png")
        object2.size = CGSize(width: 80, height: 133)
        
        //: This is the animation that makes the car go around the Earth
        object.run(SKAction.repeatForever(circularMove.reversed()))
        object2.run(SKAction.repeatForever(circularMove.reversed()))
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(Home.darkerEarth), userInfo: nil, repeats: true)
        
        
        bgImage = SKSpriteNode(imageNamed: "blurred.png")
        bgImage.position = CGPoint(x: 350, y: 270)
        bgImage.size = CGSize(width: 700, height: 540)
        self.addChild(bgImage)
        
        fader = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 700, height: 540))
        fader.fillColor = .white
        fader.alpha = 0.35
        self.addChild(fader)
        
        textLabel = SKLabelNode(text: "Gas guzzlers are ruining our Earth!")
        textLabel.position = CGPoint(x: 350, y: 450)
        textLabel.fontColor = .darkGray
        textLabel.fontSize = 22.0
        textLabel.horizontalAlignmentMode = .center
        textLabel.fontName = "Arial"
        self.addChild(textLabel)
        
        addAllEarth()
        
        earthImage = SKSpriteNode(imageNamed: "frame_0_delay-0.1s.gif")
        earthImage.position = CGPoint(x: 350, y: 250)
        earthImage.size = CGSize(width: 300, height: 300)
        
        //: This is the animation that makes the Earth spin
        let animation = SKAction.animate(with: frames, timePerFrame: 0.15)
        earthImage.run(SKAction.repeatForever(animation))
        
        self.addChild(earthImage)
        
        blackCover = SKShapeNode(circleOfRadius: 137)
        blackCover.fillColor = .darkGray
        blackCover.strokeColor = .darkGray
        blackCover.position = CGPoint(x: 350, y: 250)
        blackCover.alpha = 0
        self.addChild(blackCover)
        
        cloud1 = SKSpriteNode(imageNamed: "cloud.png")
        cloud1.position = CGPoint(x: 420, y: 280)
        cloud1.size = CGSize(width: 10, height: 10)
        cloud1.alpha = 1
        self.addChild(cloud1)
        
        cloud2 = SKSpriteNode(imageNamed: "cloud.png")
        cloud2.position = CGPoint(x: 260, y: 220)
        cloud2.size = CGSize(width: 10, height: 10)
        cloud2.alpha = 1
        self.addChild(cloud2)
        
        self.addChild(object)
    }
    func darkerEarth() {
        //: This is where I am making the Earth darker and the clouds larger
        if(blackCover.alpha < 0.8) {
            blackCover.alpha = blackCover.alpha + 0.03
            cloud1.size = CGSize(width: cloud1.frame.size.height + 3, height: cloud1.frame.size.height + 3)
            cloud2.size = CGSize(width: cloud2.frame.size.height + 3, height: cloud2.frame.size.height + 3)
        }
        else {
            object.removeAllActions()
            object.removeFromParent()
            
            timer.invalidate()
            self.addChild(object2)
            timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(Home.lighterEarth), userInfo: nil, repeats: true)
            textLabel.text = "We need to switch to electric cars now to save our Earth!"
        }
    }
    func lighterEarth() {
        //: This is where I am making the Earth lighter and the clouds smaller
        
        if(blackCover.alpha > 0) {
            blackCover.alpha = blackCover.alpha - 0.03
            cloud1.size = CGSize(width: cloud1.frame.size.height - 3, height: cloud1.frame.size.height - 3)
            cloud2.size = CGSize(width: cloud2.frame.size.height - 3, height: cloud2.frame.size.height - 3)
        }
        else {
            timer2.invalidate()
            cloud1.size = CGSize(width: 0, height: 0)
            cloud2.size = CGSize(width: 0, height: 0)
            object2.removeAllActions()
            object2.removeFromParent()
            earthImage.removeAllActions()
            earthImage.removeFromParent()
            textLabel.removeFromParent()
            
            switchLabel = SKLabelNode(text: "Customize your dream electric car now!")
            switchLabel.fontName = "HelveticaNeue-Bold"
            switchLabel.fontColor = .darkGray
            switchLabel.fontSize = 25.0
            switchLabel.position = CGPoint(x: 350, y: 270)
            switchLabel.horizontalAlignmentMode = .center
            self.addChild(switchLabel)
            
            _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(Home.loadForm), userInfo: nil, repeats: false)
        }
    }
    
    func loadForm() {
        //: This is to load the next scene
        var act : UIActivityIndicatorView!
        DispatchQueue.main.async {
            act = UIActivityIndicatorView(frame: CGRect(x: self.size.width/2, y: self.size.height/2 + 50, width: 10, height: 10))
            act.startAnimating()
            self.view?.addSubview(act)
            
            DispatchQueue.main.async {
                let scene = First()
                scene.loadedFirst = true
                scene.size = self.size
                scene.scaleMode = self.scaleMode
                let transition = SKTransition.fade(withDuration: 1)
                self.view?.presentScene(scene, transition: transition)
                act.removeFromSuperview()
            }
        }
    }
    
    func addAllEarth() {
        for x in 0...43 {
            let f = SKTexture.init(imageNamed: "frame_" + String(x) + "_delay-0.1s.gif")
            frames.append(f)
        }
    }
}




//: This class is the class that holds the data from the XML Parser
class Car {
    var carName: String = String()
    var carPrice: String = String()
    var carRange: String = String()
    var batterySize : String = String()
    var maxSeats : String = String()
    var maintenance : String = String()
    var depreciation : String = String()
    var finalCost : String = String()
}

//: This scene shows the results of what cars you would like
public class Results : SKScene, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var cars: [Car] = []
    var eName: String = String()
    var carName = String()
    var carPrice = String()
    var carRange = String()
    var batterySize = String()
    var maxSeats = String()
    var maintenance = String()
    var depreciation = String()
    
    var acceptedVehicles: [Car] = []
    var savedViaGas: [Float] = []
    
    let lengthOfOwnership : Float = 5
    let gasAverage : Float = 3.0
    let mpgaverage : Float = 25.0
    
    var acceptedCounter = 0
    
    var showingFilter : Bool = false
    
    var sortStyle = 1
    
    var tableView: UITableView!
    var items = ["", "Best Value", "Price Low to High", "Price High to Low", "Range Low to High", "Range High to Low"]
    
    var arrowImage : SKSpriteNode!
    
    var budgetNumber : SKLabelNode!
    var milesNumber : SKLabelNode!
    var seatsNumber : SKLabelNode!
    
    var budgetValue : SKLabelNode!
    var rangeValue : SKLabelNode!
    var seatsValue : SKLabelNode!
    var budgetSlider : UISlider!
    var rangeSlider : UISlider!
    var seatsSlider : UISlider!
    
    var noFit : SKLabelNode!
    var noFit2 : SKLabelNode!
    var noFit3 : SKLabelNode!
    var noFit4 : SKLabelNode!
    var loadingIcon : SKSpriteNode!
    
    var activityIndicator : UIActivityIndicatorView!
    
    var frontView : UIView!
    var backView : UIView!
    var container : UIView!
    var singleFingerTap : UITapGestureRecognizer!
    
    var containerArray : [UIView] = []
    var frontViewArray : [UIView] = []
    var backViewArray : [UIView] = []
    var flipBool : [Bool] = []
    
    var clickForCarsLabel : SKLabelNode!
    var clickForCarsBg : SKShapeNode!
    
    var starIs : SKLabelNode!
    var starIsBg : SKShapeNode!
    
    public override func didMove(to view: SKView) {
        
        //: Here I am adding all of the elements needed to the SKScene
        self.view?.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = true
        
        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        
        let carScreen = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 700, height: 390))
        carScreen.strokeColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
        carScreen.fillColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
        self.addChild(carScreen)
        
        let backgroundBox = SKShapeNode(rect: CGRect(x: 0, y: 390, width: 700, height: 150))
        backgroundBox.fillColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        backgroundBox.strokeColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        self.addChild(backgroundBox)
        
        
        let budgetLabel = SKLabelNode(text: "Budget")
        budgetLabel.position = CGPoint(x: 120, y: 510)
        budgetLabel.fontColor = .darkGray
        budgetLabel.fontName = "HelveticaNeue-Bold"
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        budgetSlider = UISlider(frame:CGRect(x: 30, y: 50, width: 180, height: 20))
        budgetSlider.minimumValue = 25000
        budgetSlider.maximumValue = 90000
        budgetSlider.isContinuous = true
        budgetSlider.tintColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
        budgetSlider.value = Float(budgetGlobal)
        budgetSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        budgetSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        budgetSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(budgetSlider)
        
        let inte = Int(budgetSlider.value)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        budgetValue = SKLabelNode(text: "$" + numberFormatter.string(from: NSNumber(value: inte))!)
        budgetValue.position = CGPoint(x: 120, y: 420)
        budgetValue.fontColor = .darkGray
        budgetValue.horizontalAlignmentMode = .center
        budgetValue.fontName = "HelveticaNeue-Bold"
        budgetValue.fontSize = 18.0
        self.addChild(budgetValue)
        
        let rangeLabel = SKLabelNode(text: "Range")
        rangeLabel.position = CGPoint(x: 350, y: 510)
        rangeLabel.fontColor = .darkGray
        rangeLabel.fontName = "HelveticaNeue-Bold"
        rangeLabel.fontSize = 18.0
        self.addChild(rangeLabel)
        
        rangeSlider = UISlider(frame:CGRect(x: 260, y: 50, width: 180, height: 20))
        rangeSlider.minimumValue = 50
        rangeSlider.maximumValue = 240
        rangeSlider.isContinuous = true
        rangeSlider.tintColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
        rangeSlider.value = Float(milesGlobal)
        rangeSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        rangeSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        rangeSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(rangeSlider)
        
        rangeValue = SKLabelNode(text: String(Int(rangeSlider.value)) + " miles")
        rangeValue.position = CGPoint(x: 350, y: 420)
        rangeValue.fontColor = .darkGray
        rangeValue.horizontalAlignmentMode = .center
        rangeValue.fontName = "HelveticaNeue-Bold"
        rangeValue.fontSize = 18.0
        self.addChild(rangeValue)
        
        
        let seatsLabel = SKLabelNode(text: "Seats")
        seatsLabel.position = CGPoint(x: 580, y: 510)
        seatsLabel.fontColor = .darkGray
        seatsLabel.fontName = "HelveticaNeue-Bold"
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        seatsSlider = UISlider(frame:CGRect(x: 490, y: 50, width: 180, height: 20))
        seatsSlider.minimumValue = 4
        seatsSlider.maximumValue = 7
        seatsSlider.isContinuous = true
        seatsSlider.tintColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
        seatsSlider.value = Float(seatsGlobal)
        seatsSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        seatsSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        seatsSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(seatsSlider)
        
        seatsValue = SKLabelNode(text: String(Int(seatsSlider.value)))
        seatsValue.position = CGPoint(x: 580, y: 420)
        seatsValue.fontColor = .darkGray
        seatsValue.horizontalAlignmentMode = .center
        seatsValue.fontName = "HelveticaNeue-Bold"
        seatsValue.fontSize = 18.0
        self.addChild(seatsValue)
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.frame = CGRect(x: self.size.width/2, y: self.size.height/2, width: 0, height: 0)
        self.view?.addSubview(activityIndicator)
        
        
        let filterBy = SKLabelNode(text: "Sort By")
        filterBy.position = CGPoint(x: 600, y: 360)
        filterBy.name = "filterBy"
        filterBy.fontName = "HelveticaNeue-Bold"
        filterBy.fontColor = .white
        filterBy.fontSize = 15
        self.addChild(filterBy)
        
        let downArrow = SKSpriteNode(imageNamed: "down.png")
        downArrow.position = CGPoint(x: 640, y: 365)
        downArrow.size = CGSize(width: 10, height: 10)
        downArrow.name = "filterBy"
        self.addChild(downArrow)
        
        
        
        self.tableView = UITableView(frame:CGRect(x: 498, y: 195, width: 160, height: 145))
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView!.allowsSelection = true
        self.tableView.isHidden = true
        self.tableView.alwaysBounceVertical = false
        self.view?.addSubview(self.tableView)
        
        
        arrowImage = SKSpriteNode(imageNamed: "arrow.png")
        arrowImage.position = CGPoint(x: 620, y: 350)
        arrowImage.size = CGSize(width: 30, height: 30)
        arrowImage.isHidden = true
        self.addChild(arrowImage)
        
        clickForCarsBg = SKShapeNode(rect: CGRect(x: 150, y:360, width: 400, height: 20), cornerRadius: 2)
        clickForCarsBg.strokeColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        clickForCarsBg.fillColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        self.addChild(clickForCarsBg)
        
        clickForCarsLabel = SKLabelNode(text: "Click on each car for more information")
        clickForCarsLabel.position = CGPoint(x: 350, y: 362)
        clickForCarsLabel.fontSize = 18
        clickForCarsLabel.fontName = "HelveticaNeue-Bold"
        clickForCarsLabel.fontColor = .darkGray
        self.addChild(clickForCarsLabel)
        
        
        starIsBg = SKShapeNode(rect: CGRect(x: 150, y:10, width: 400, height: 20), cornerRadius: 2)
        starIsBg.strokeColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        starIsBg.fillColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        self.addChild(starIsBg)
        
        starIs = SKLabelNode(text: "*Cost of ownership over 5 years")
        starIs.position = CGPoint(x: 350, y: 12)
        starIs.fontSize = 18
        starIs.fontName = "HelveticaNeue-Bold"
        starIs.fontColor = .darkGray
        self.addChild(starIs)
        
        
        noFit = SKLabelNode(text: "Sadly, at this time we don't know of any EV")
        noFit.position = CGPoint(x: 350, y: 300)
        noFit.horizontalAlignmentMode = .center
        noFit.fontName = "HelveticaNeue-Bold"
        noFit.fontColor = .white
        noFit.fontSize = 25.0
        self.addChild(noFit)
        
        noFit2 = SKLabelNode(text: "that match your search.")
        noFit2.position = CGPoint(x: 350, y: 275)
        noFit2.fontName = "HelveticaNeue-Bold"
        noFit2.fontColor = .white
        noFit2.fontSize = 25.0
        self.addChild(noFit2)
        
        noFit3 = SKLabelNode(text: "We can help you find something else ")
        noFit3.position = CGPoint(x: 350, y: 225)
        noFit3.fontName = "HelveticaNeue-Bold"
        noFit3.fontColor = .white
        noFit3.fontSize = 25.0
        self.addChild(noFit3)
        
        noFit4 = SKLabelNode(text: "if you change your needs abve.")
        noFit4.position = CGPoint(x: 350, y: 200)
        noFit4.fontName = "HelveticaNeue-Bold"
        noFit4.fontColor = .white
        noFit4.fontSize = 25.0
        self.addChild(noFit4)
        
        algorithm()
    }
    //: When the slider changes, I call this function which updates the labels underneath the slider
    public func sliderValueChanged() {
        let inte = Int(budgetSlider.value) / 1000 * 1000
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        budgetValue.text = "$" + numberFormatter.string(from: NSNumber(value: inte))!
        
        rangeValue.text = String(Int(rangeSlider.value)) + " miles"
        seatsValue.text = String(Int(seatsSlider.value))
    }
    public func updateData() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            DispatchQueue.main.async {
                self.refreshCars()
            }
        }
    }
    public func refreshCars() {
        acceptedCounter = 0
        acceptedVehicles = []
        algorithm()
        
        
    }
    //: This is the main algorithm which finds out what cars will fit your parameters and which one is the best value
    public func algorithm() {
        //: How to get data from XML
        if((cars.count-1) > 0) {
            for x in 0...cars.count-1 {
                let car = cars[x]
                var b = false
                var s = false
                var dm = false
                
                let carCost = Int(car.carPrice)
                if (carCost! < Int(budgetSlider.value)) {
                    b = true
                }
                
                let carSeats = Int(car.maxSeats)
                if(carSeats! >= Int(seatsSlider.value)) {
                    s = true
                }
                let carRange = Int(car.carRange)
                if(carRange! >= Int(rangeSlider.value)) {
                    dm = true
                }
                
                if (b == true && s == true && dm == true) {
                    acceptedVehicles.append(car)
                    
                    let carCost : Float = Float(car.carPrice)!
                    let maintenance : Float = Float(car.maintenance)! * Float(lengthOfOwnership)
                    let gasCost : Float = (Float(Int(rangeSlider.value))/mpgaverage) * gasAverage * lengthOfOwnership
                    
                    let year : Float = Float(Int(rangeSlider.value) * 365)
                    let carRange2 : Float = Float(car.carRange)!
                    let size: Float = Float(car.batterySize)!
                    let electricityCost : Float = (year/carRange2) * size * 0.12
                    
                    //depreciation is the cost that you sell for after 5 years
                    let depreciation : Float = Float(car.depreciation)!
                    
                    let finalCost =  carCost - gasCost + maintenance + electricityCost - 7500.0 - depreciation
                    
                    //12 cents per kwh
                    acceptedVehicles[acceptedCounter].finalCost = String(finalCost)
                    savedViaGas.append(finalCost)
                    acceptedCounter += 1
                    
                }
            }
        }
        sortData()
        print("algr")
        
    }
    //: Here I am removing all of the cars from the view
    public func removeCars() {
        for x in 0...containerArray.count-1 {
            frontViewArray[x].removeFromSuperview()
            backViewArray[x].removeFromSuperview()
            containerArray[x].removeFromSuperview()
        }
        frontViewArray = []
        backViewArray = []
        containerArray = []
    }
    //: Here I am adding all of the cars to the view
    public func addCars() {
        if(containerArray.count != 0) {
            removeCars()
        }
        if(acceptedVehicles.count-1 >= 0) {
            for x in 0...acceptedVehicles.count-1 {
                var xcoord = 0
                var y = 350
                if(x < 4) {
                    y = 200
                    xcoord = x
                }
                else if (x < 8 && x > 4) {
                    y = 350
                    xcoord = x - 4
                }
                else if (x > 8) {
                    xcoord = 6
                }
                
                let imageName = acceptedVehicles[x].carName + ".png"
                frontView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 130))
                frontView.backgroundColor = .blue
                
                
                
                container = UIView(frame: CGRect(x: 160*xcoord + 40, y: y, width: 140, height: 130))
                container.isUserInteractionEnabled = true
                let imageN = UIImage(named: imageName)
                frontView.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.662745098, blue: 0.8588235294, alpha: 1)
                let imageView = UIImageView(image: imageN)
                imageView.frame = CGRect(x: 20, y: -10, width: 100, height: 100)
                frontView.addSubview(imageView)
                
                let carName = UILabel(frame: CGRect(x: 5, y: 100, width: 130, height: 20))
                carName.text = acceptedVehicles[x].carName
                carName.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
                carName.textColor = .darkGray
                carName.adjustsFontSizeToFitWidth = true
                carName.textAlignment = .center
                frontView.addSubview(carName)
                
                
                backView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 130))
                backView.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.662745098, blue: 0.8588235294, alpha: 1)
                
                let carName2 = UILabel(frame: CGRect(x: 5, y: 10, width: 130, height: 20))
                carName2.text = acceptedVehicles[x].carName
                carName2.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
                carName2.textColor = .darkGray
                carName2.adjustsFontSizeToFitWidth = true
                carName2.textAlignment = .center
                backView.addSubview(carName2)
                
                
                let carPrice = UILabel(frame: CGRect(x: 0, y: 40, width: 140, height: 20))
                carPrice.textAlignment = .center
                let inte = Int(acceptedVehicles[x].carPrice)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = NumberFormatter.Style.decimal
                carPrice.text = "MSRP: $" + numberFormatter.string(from: NSNumber(value: inte!))!
                carPrice.adjustsFontSizeToFitWidth = true
                carPrice.textColor = .darkGray
                backView.addSubview(carPrice)
                
                let carRange = UILabel(frame: CGRect(x: 0, y: 70, width: 140, height: 20))
                carRange.textAlignment = .center
                carRange.text = "Range: " + acceptedVehicles[x].carRange + " miles"
                carRange.adjustsFontSizeToFitWidth = true
                carRange.textColor = .darkGray
                backView.addSubview(carRange)

                acceptedVehicles[x].finalCost
                let val = Int(Float(acceptedVehicles[x].finalCost)!)
                let ownCostNumber = UILabel(frame: CGRect(x: 0, y: 100, width: 140, height: 20))
                ownCostNumber.textAlignment = .center
                ownCostNumber.text = "*Cost: $" + numberFormatter.string(from: NSNumber(value: val))!
                ownCostNumber.adjustsFontSizeToFitWidth = true
                ownCostNumber.textColor = .darkGray
                backView.addSubview(ownCostNumber)
                
                container.tag = x
                frontView.tag = x
                backView.tag = x
                container.addSubview(backView)
                container.addSubview(frontView)
                self.view?.addSubview(container)
                frontViewArray.append(frontView)
                backViewArray.append(backView)
                containerArray.append(container)
                
                flipBool.append(true)
                
                singleFingerTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                
                frontView.addGestureRecognizer(singleFingerTap)
                backView.addGestureRecognizer(singleFingerTap)
                container.addGestureRecognizer(singleFingerTap)
                
                self.activityIndicator.stopAnimating()
            }
            clickForCarsLabel.isHidden = false
            clickForCarsBg.isHidden = false
            starIs.isHidden = false
            starIsBg.isHidden = false

            noFit.isHidden = true
            noFit2.isHidden = true
            noFit3.isHidden = true
            noFit4.isHidden = true
            print("Cars added 2")
            
            rangeSlider.isEnabled = true
            budgetSlider.isEnabled = true
            seatsSlider.isEnabled = true
        }
        else {
            clickForCarsLabel.isHidden = true
            clickForCarsBg.isHidden = true
            starIs.isHidden = true
            starIsBg.isHidden = true
            noFit.isHidden = false
            noFit2.isHidden = false
            noFit3.isHidden = false
            noFit4.isHidden = false

            self.activityIndicator.stopAnimating()
            
            rangeSlider.isEnabled = true
            budgetSlider.isEnabled = true
            seatsSlider.isEnabled = true
        }
    }
    
    //: When the user clicks on a card, this is what flips it
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        for x in 0...frontViewArray.count-1 {
            if frontViewArray[x].tag == sender.view!.tag {
                let v1 = (flipBool[x] ? self.frontViewArray[x] : self.backViewArray[x])
                let v2 = (flipBool[x] ? self.backViewArray[x] : self.frontViewArray[x])
                let options: UIViewAnimationOptions = [.transitionFlipFromLeft, .curveEaseInOut]
                
                UIView.transition(from: v1, to: v2, duration: 0.5, options: options) { finished in
                    
                    self.flipBool[x] = !self.flipBool[x]
                }
            }
        }
    }
    
    //: Here I sort the data based on price: high to low, price: low to high, or best value
    public func sortData() {
        acceptedVehicles
        if(acceptedVehicles.count > 0) {
            if(sortStyle == 1) {
                var integerArray : [Float] = []
                if(acceptedVehicles.count-1 > 0) {
                    for x in 0...acceptedVehicles.count-1 {
                        integerArray.append(Float(acceptedVehicles[x].finalCost)!)
                    }
                    integerArray.sort {
                        return $0 < $1
                    }
                    
                    var arrayToChange : [Car] = [acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0]]
                    for a in 0...acceptedVehicles.count-1 {
                        let car = acceptedVehicles[a]
                        for y in 0...integerArray.count-1 {
                            if (Float(car.finalCost) == Float(integerArray[y])) {
                                arrayToChange[y] = car
                                break
                            }
                        }
                    }
                    for x in 0...acceptedVehicles.count-1 {
                        acceptedVehicles[x] = arrayToChange[x]
                    }
                }
                addCars()
                
            }
            
            if(sortStyle == 2) {
                var integerArray : [Float] = []
                for x in 0...acceptedVehicles.count-1 {
                    integerArray.append(Float(acceptedVehicles[x].carPrice)!)
                }
                integerArray.sort {
                    return $0 < $1
                }
                var arrayToChange : [Car] = [acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0]]
                for a in 0...acceptedVehicles.count-1 {
                    let car = acceptedVehicles[a]
                    for y in 0...integerArray.count-1 {
                        if (Float(car.carPrice) == Float(integerArray[y])) {
                            arrayToChange[y] = car
                            break
                        }
                    }
                }
                for x in 0...acceptedVehicles.count-1 {
                    acceptedVehicles[x] = arrayToChange[x]
                }
                addCars()
            }
            if(sortStyle == 3) {
                
                var integerArray : [Float] = []
                for x in 0...acceptedVehicles.count-1 {
                    integerArray.append(Float(acceptedVehicles[x].carPrice)!)
                }
                integerArray.sort {
                    return $0 > $1
                }
                var arrayToChange : [Car] = [acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0], acceptedVehicles[0]]
                for a in 0...acceptedVehicles.count-1 {
                    let car = acceptedVehicles[a]
                    for y in 0...integerArray.count-1 {
                        if (Float(car.carPrice) == Float(integerArray[y])) {
                            arrayToChange[y] = car
                            break
                        }
                    }
                }
                for x in 0...acceptedVehicles.count-1 {
                    acceptedVehicles[x] = arrayToChange[x]
                }
                addCars()
            }
        }
        else {
            addCars()
        }
    }
    

    //: XMLParser delegate methods
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
        if elementName == "item" {
            carName = String()
            carPrice = String()
            carRange = String()
            batterySize = String()
            maxSeats = String()
            maintenance = String()
            depreciation = String()
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            
            let car = Car()
            car.carName = carName
            car.carPrice = carPrice
            car.carRange = carRange
            car.batterySize = batterySize
            car.maxSeats = maxSeats
            car.maintenance = maintenance
            car.depreciation = depreciation
            
            cars.append(car)
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if eName == "name" {
                carName += data
            } else if eName == "price" {
                carPrice += data
            } else if eName == "range" {
                carRange += data
            } else if eName == "size" {
                batterySize += data
            } else if eName == "maxSeats" {
                maxSeats += data
            } else if eName == "maintenance" {
                maintenance += data
            } else if eName == "depreciation" {
                depreciation += data
            }
        }
    }
    
    
    
    //: Table View Delegate Methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        cell.textLabel?.font.withSize(5)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size:15)
        cell.textLabel?.textColor = .darkGray
        cell.textLabel?.textAlignment = .left
        
        if(cell.textLabel?.text == "") {
            cell.textLabel?.text = "Sort By:"
            cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size:18)
            cell.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.6784313725, blue: 0.07450980392, alpha: 1)
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0) {
            return 30
        }
        return 40
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sortStyle = indexPath.row
        self.tableView?.isHidden = true
        self.arrowImage.isHidden = true
        rangeSlider.isEnabled = false
        budgetSlider.isEnabled = false
        seatsSlider.isEnabled = false
        sortData()
    }
    
    
    
    //: This is the function that senses touch for the other elements in the view
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "filterBy" {
                if(showingFilter == false) {
                    self.view?.bringSubview(toFront: tableView)
                    arrowImage.zPosition = 2.0
                    self.tableView?.isHidden = false
                    self.arrowImage.isHidden = false
                    showingFilter = true
                }
                else if(showingFilter == true) {
                    self.tableView?.isHidden = true
                    self.arrowImage.isHidden = true
                    showingFilter = false
                }
            }
        }
            
        else if (showingFilter == true) {
            self.arrowImage.isHidden = true
            self.tableView?.isHidden = true
            showingFilter = false
        }
    }
}


//: This is where I am adding the SKScene to the live view
let frame = CGRect(x: 0, y: 0, width: 700, height: 540)

let skView = SKView(frame: frame)

skView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]

let scene = First(size: frame.size)
scene.scaleMode = .aspectFit

skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
