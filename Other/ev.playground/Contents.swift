import UIKit
import SpriteKit
import PlaygroundSupport

public class MainScreen : SKScene {
    
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
                let scene = Form()
                scene.size = size
                scene.scaleMode = scaleMode
                let transition = SKTransition.fade(withDuration: 1)
                self.view?.presentScene(scene, transition: transition)
            }
        }
    }
}
public class Form : SKScene {
    
    var milesDailyTextField : SKLabelNode!
    var milesYearlyTextField : SKLabelNode!
    var howLongTextField : SKLabelNode!
    
    var budgetLabel : SKLabelNode!
    var milesDailyLabel : SKLabelNode!
    var seatsLabel : SKLabelNode!
    var milesYearlyLabel : SKLabelNode!
    var howLongLabel : SKLabelNode!
    
    var k30 : SKLabelNode!
    var k50 : SKLabelNode!
    var k70 : SKLabelNode!
    var k100 : SKLabelNode!
    var plus : SKLabelNode!
    var seats4 : SKLabelNode!
    var seats5 : SKLabelNode!
    var seats6 : SKLabelNode!
    var seats7 : SKLabelNode!
    var nextButton : SKLabelNode!
    
    
    var price = 0
    var s4 = false
    var s5 = false
    var s6 = false
    var s7 = false
    var milesDaily:Int? = 0
    var milesYearly:Int? = 0
    var howLong:Int? = 0
    
    
    public override func didMove(to view: SKView) {
        
        budgetLabel = SKLabelNode(text: "What is your budget?")
        budgetLabel.position = CGPoint(x: 100, y: 460)
        budgetLabel.fontColor = SKColor.white
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        k30 = SKLabelNode(text: "< 30k")
        k30.position = CGPoint(x: 60, y: 440)
        k30.name = "30k"
        k30.fontColor = SKColor.white
        k30.fontSize = 18.0
        self.addChild(k30)
        
        k50 = SKLabelNode(text: "< 50k")
        k50.position = CGPoint(x: 140, y: 440)
        k50.name = "50k"
        k50.fontColor = SKColor.white
        k50.fontSize = 18.0
        self.addChild(k50)
        
        k70 = SKLabelNode(text: "< 70k")
        k70.position = CGPoint(x: 180, y: 440)
        k70.name = "70k"
        k70.fontColor = SKColor.white
        k70.fontSize = 18.0
        self.addChild(k70)
        
        k100 = SKLabelNode(text: "< 100k")
        k100.position = CGPoint(x: 220, y: 440)
        k100.name = "100k"
        k100.fontColor = SKColor.white
        k100.fontSize = 18.0
        self.addChild(k100)
        
        plus = SKLabelNode(text: "Over 100k")
        plus.position = CGPoint(x: 260, y: 440)
        plus.name = "100k"
        plus.fontColor = SKColor.white
        plus.fontSize = 18.0
        self.addChild(plus)
        
        
        
        
        milesDailyLabel = SKLabelNode(text: "How many miles do you drive daily?")
        milesDailyLabel.position = CGPoint(x: 100, y: 400)
        milesDailyLabel.fontColor = SKColor.white
        milesDailyLabel.fontSize = 18.0
        self.addChild(milesDailyLabel)
        
        
        
        milesYearlyLabel = SKLabelNode(text: "How many miles do you drive yearly?")
        milesYearlyLabel.position = CGPoint(x: 100, y: 340)
        milesYearlyLabel.fontColor = SKColor.white
        milesYearlyLabel.fontSize = 18.0
        self.addChild(milesYearlyLabel)
        
        
        
        
        seatsLabel = SKLabelNode(text: "What is the minumum number of seats you need?")
        seatsLabel.position = CGPoint(x: 100, y: 280)
        seatsLabel.fontColor = SKColor.white
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        seats4 = SKLabelNode(text: "4")
        seats4.position = CGPoint(x: 100, y: 260)
        seats4.name = "4seats"
        seats4.fontColor = SKColor.white
        seats4.fontSize = 18.0
        self.addChild(seats4)
        
        seats5 = SKLabelNode(text: "5")
        seats5.position = CGPoint(x: 130, y: 260)
        seats5.name = "5seats"
        seats5.fontColor = SKColor.white
        seats5.fontSize = 18.0
        self.addChild(seats5)
        
        seats6 = SKLabelNode(text: "6")
        seats6.position = CGPoint(x: 160, y: 260)
        seats6.name = "6seats"
        seats6.fontColor = SKColor.white
        seats6.fontSize = 18.0
        self.addChild(seats6)
        
        seats7 = SKLabelNode(text: "7")
        seats7.position = CGPoint(x: 190, y: 260)
        seats7.name = "7seats"
        seats7.fontColor = SKColor.white
        seats7.fontSize = 18.0
        self.addChild(seats7)
        
        
        
        
        howLongLabel = SKLabelNode(text: "How long do you plan on owning the car?")
        howLongLabel.position = CGPoint(x: 100, y: 220)
        howLongLabel.fontColor = SKColor.white
        howLongLabel.fontSize = 18.0
        self.addChild(howLongLabel)
        
        
        
        
        nextButton = SKLabelNode(text: "Next")
        nextButton.position = CGPoint(x: 400, y: 100)
        nextButton.name = "next"
        nextButton.fontColor = SKColor.white
        nextButton.fontSize = 18.0
        self.addChild(nextButton)

    }
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "30k"
            {
                let background = SKSpriteNode(color: SKColor.white, size: CGSize(width: k30.frame.size.width, height: k30.frame.size.height))
                background.position = CGPoint(x: k30.frame.midX , y: k30.frame.midY)
                self.addChild(background)
                
                k30 = SKLabelNode(text: "< 30k")
                k30.position = CGPoint(x: 60, y: 440)
                k30.name = "30k"
                k30.fontColor = SKColor.black
                k30.fontSize = 18.0
                self.addChild(k30)

            }
            
            if name == "next" {
                let scene = XML()
                scene.size = size
                scene.scaleMode = scaleMode
                let transition = SKTransition.fade(withDuration: 1)
                self.view?.presentScene(scene, transition: transition)
            }
        }
    }
}






class Car {
    var carName: String = String()
    var carPrice: String = String()
    var carRange: String = String()
    var batterySize : String = String()
    var maxSeats : String = String()
    var maintenance : String = String()

}
public class XML : SKScene, XMLParserDelegate {
    
    var cars: [Car] = []
    var eName: String = String()
    var carName = String()
    var carPrice = String()
    var carRange = String()
    var batterySize = String()
    var maxSeats = String()
    var maintenance = String()

    var acceptedVehicles: [Car] = []
    var savedViaGas: [Float] = []

    public override func didMove(to view: SKView) {
        
        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        let budget = 100000
        let seatsNeeded = 5
        let dailyMiles = 100
        let yearlyMiles = 10000
        let length = 10
        let milesAtEnd = yearlyMiles * length
        
        let gasCost = (yearlyMiles/25) * 3 * length
        
        

        //: How to get data from XML
        
        for x in 0...cars.count-1 {
            let car = cars[x]
            var b = false
            var s = false
            var dm = false

            let carCost = Int(car.carPrice)
            if (carCost! < budget) {
                b = true
            }
            
            let carSeats = Int(car.maxSeats)
            if(carSeats! >= seatsNeeded) {
                s = true
            }
            let carRange = Int(car.carRange)
            if(carRange! >= dailyMiles) {
                dm = true
            }
            
            if (b == true && s == true && dm == true) {
                acceptedVehicles.append(car)
                
                //12 cents per kwh
                let size = Float(car.batterySize)
                let carRange2 = Float(car.carRange)
                let year = Float(yearlyMiles)
                let electricityCost = (year/carRange2!) * size! * 0.12
                
                
                let main = Float(car.maintenance)
                let maintenanceCost = main! * Float(length)
                
                //$875 per year for gas car
                let generalMaintenance = 870.0 * Float(length)
                
                savedViaGas.append((electricityCost - Float(gasCost)))


            }
        }
        print(acceptedVehicles.count)
        acceptedVehicles
        savedViaGas
        
        let car = cars[0]
        print(car.maxSeats)
        
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
            }
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "30k"
            {
                
                
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


let scene = MainScreen(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView