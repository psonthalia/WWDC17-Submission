import UIKit
import SpriteKit
import PlaygroundSupport

class Car {
    var carName: String = String()
    var carPrice: String = String()
    var carRange: String = String()
    var batterySize : String = String()
    var maxSeats : String = String()
    var maintenance : String = String()
    
}

public class Results : SKScene, XMLParserDelegate {
    
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
    
    var seats = 5
    var miles = 50
    var budgetText = 50000
    
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
        let lengthOfOwnership : Float = 5
        let gasAverage : Float = 3.0
        let mpgaverage : Float = 25.0
        
//        let milesAtEnd = dailyMiles * lengthOfOwnership
//        
//        let gasCost = (dailyMiles/25) * 3 * lengthOfOwnership
        
        
        
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
                
//                let size = Float(car.batterySize)
//                let carRange2 = Float(car.carRange)
//                let yearlyMiles = Float(dailyMiles * 365)
//                let gasCost = (yearlyMiles/25) * 15
//                let main = Float(car.maintenance)! * 5
//                let electricityCost = (yearlyMiles/carRange2!) * size! * 0.12
//
//
//                
                let carCost : Float = Float(car.carPrice)!
                let maintenance : Float = Float(car.maintenance)! * Float(lengthOfOwnership)
                let gasCost : Float = (Float(dailyMiles)/mpgaverage) * gasAverage * lengthOfOwnership
                
                let year : Float = Float(dailyMiles * 365)
                let carRange2 : Float = Float(car.carRange)!
                let size: Float = Float(car.batterySize)!
                let electricityCost : Float = (year/carRange2) * size * 0.12
                
                //depreciation is the cost that you sell for after 5 years
                let depreciation : Float = 0


                let finalCost =  carCost - gasCost + maintenance + electricityCost - 7500.0 - depreciation

                
                //12 cents per kwh
//                let size = Float(car.batterySize)
//                let carRange2 = Float(car.carRange)
//                let year = Float(dailyMiles * 365)
//                let electricityCost = (year/carRange2!) * size! * 0.12
//                
//                
//                let main = Float(car.maintenance)
//                let maintenanceCost = main! * Float(length)
//                
//                //$875 per year for gas car
//                let generalMaintenance = 870.0 * Float(length)
                
                savedViaGas.append(finalCost)
                
                
            }
        }
        print(acceptedVehicles.count)
        acceptedVehicles
        savedViaGas
        
        let car = cars[0]
        print(car.maxSeats)
        
        let carScreen = SKShapeNode(rect: CGRect(x: 205, y: 5, width: 490, height: 500))
        carScreen.strokeColor = .red
        carScreen.fillColor = .red
        self.addChild(carScreen)
        
        for x in 0...acceptedVehicles.count-1 {
            
//            let backgroundBox = SKShapeNode(rect: CGRect(x: 50, y: 380 - 120*x, width: 400, height: 100))
//            backgroundBox.fillColor = .white
//            self.addChild(backgroundBox)
//            
//            let imageName = acceptedVehicles[x].carName + ".png"
//            let image = SKSpriteNode(imageNamed: imageName)
//            image.position = CGPoint(x: 100, y: 430 - 120*x)
//            image.size = CGSize(width: 100, height: 100)
//            self.addChild(image)
//            
//            
//            let carName = SKLabelNode(text: acceptedVehicles[x].carName)
//            carName.position = CGPoint(x: 200, y: 450 - 120*x)
//            carName.fontColor = .black
//            carName.fontSize = 15.0
//            self.addChild(carName)
//            
//            
//            var carPriceString = "$" + acceptedVehicles[x].carPrice
//            carPriceString.insert(",", at: carPriceString.index(carPriceString.startIndex, offsetBy: 3))
//            
//            let carPrice = SKLabelNode(text: carPriceString)
//            carPrice.position = CGPoint(x: 400, y: 450 - 120*x)
//            carPrice.fontColor = .black
//            carPrice.fontSize = 15.0
//            self.addChild(carPrice)
//            
//            
//            var rangeString = "Range: " + acceptedVehicles[x].carRange + " miles"
//            let carRange = SKLabelNode(text: rangeString)
//            carRange.position = CGPoint(x: 210, y: 420 - 120*x)
//            carRange.fontColor = .black
//            carRange.fontSize = 15.0
//            self.addChild(carRange)
            
            
            
            let backgroundBox = SKShapeNode(rect: CGRect(x: 250, y: 385 - 120*x, width: 420, height: 100))
            backgroundBox.fillColor = .white
            self.addChild(backgroundBox)
            
            let imageName = acceptedVehicles[x].carName + ".png"
            let image = SKSpriteNode(imageNamed: imageName)
            image.position = CGPoint(x: 300, y: 435 - 120*x)
            image.size = CGSize(width: 100, height: 100)
            self.addChild(image)
            
            
            let carName = SKLabelNode(text: acceptedVehicles[x].carName)
            carName.position = CGPoint(x: 400, y: 435 - 120*x)
            carName.fontColor = .black
            carName.fontSize = 15.0
            self.addChild(carName)
            
            
            var carPriceString = "$" + acceptedVehicles[x].carPrice
            carPriceString.insert(",", at: carPriceString.index(carPriceString.startIndex, offsetBy: 3))
            
            let carPrice = SKLabelNode(text: carPriceString)
            carPrice.position = CGPoint(x: 600, y: 435 - 120*x)
            carPrice.fontColor = .black
            carPrice.fontSize = 15.0
            self.addChild(carPrice)
            
            
            var rangeString = "Range: " + acceptedVehicles[x].carRange + " miles"
            let carRange = SKLabelNode(text: rangeString)
            carRange.position = CGPoint(x: 410, y: 400 - 120*x)
            carRange.fontColor = .black
            carRange.fontSize = 15.0
            self.addChild(carRange)
            
            
        }
        
        
        
        let backgroundBox = SKShapeNode(rect: CGRect(x: 5, y: 5, width: 200, height: 500))
        backgroundBox.fillColor = .gray
        backgroundBox.strokeColor = .gray
        self.addChild(backgroundBox)
        
        let budgetLabel = SKLabelNode(text: "Budget")
        budgetLabel.position = CGPoint(x: 100, y: 440)
        budgetLabel.fontColor = SKColor.black
        budgetLabel.fontName = "HelveticaNueue-Bold"
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        let circleMinusBudget = SKShapeNode(circleOfRadius: 10)
        circleMinusBudget.position = CGPoint(x: 50, y: 417)
        circleMinusBudget.fillColor = SKColor.black
        self.addChild(circleMinusBudget)
        
        let minusBudget = SKLabelNode(text: "-")
        minusBudget.position = CGPoint(x: 50, y: 410)
        minusBudget.name = "minusBudget"
        minusBudget.fontName = "HelveticaNueue-Bold"
        minusBudget.fontColor = SKColor.white
        minusBudget.fontSize = 20.0
        self.addChild(minusBudget)
        
        let budgetNumber = SKLabelNode(text: String(budgetText))
        budgetNumber.position = CGPoint(x: 100, y: 410)
        budgetNumber.fontColor = SKColor.black
        budgetNumber.fontSize = 20
        self.addChild(budgetNumber)
        
        let circlePlusBudget = SKShapeNode(circleOfRadius: 10)
        circlePlusBudget.position = CGPoint(x: 150, y: 417)
        circlePlusBudget.fillColor = SKColor.black
        self.addChild(circlePlusBudget)
        
        let plusBudget = SKLabelNode(text: "+")
        plusBudget.position = CGPoint(x: 150, y: 410)
        plusBudget.name = "plusBudget"
        plusBudget.fontName = "HelveticaNueue-Bold"
        plusBudget.fontColor = SKColor.white
        plusBudget.fontSize = 20
        self.addChild(plusBudget)
        
        
        
        
        let rangeLabel = SKLabelNode(text: "Range")
        rangeLabel.position = CGPoint(x: 100, y: 370)
        rangeLabel.fontColor = SKColor.black
        rangeLabel.fontName = "HelveticaNueue-Bold"
        rangeLabel.fontSize = 18.0
        self.addChild(rangeLabel)
        
        let circleMinusRange = SKShapeNode(circleOfRadius: 10)
        circleMinusRange.position = CGPoint(x: 50, y: 347)
        circleMinusRange.fillColor = SKColor.black
        self.addChild(circleMinusRange)
        
        let minusRange = SKLabelNode(text: "-")
        minusRange.position = CGPoint(x: 50, y: 340)
        minusRange.name = "minusRange"
        minusRange.fontName = "HelveticaNueue-Bold"
        minusRange.fontColor = SKColor.white
        minusRange.fontSize = 20.0
        self.addChild(minusRange)
        
        let rangeNumber = SKLabelNode(text: String(miles))
        rangeNumber.position = CGPoint(x: 100, y: 340)
        rangeNumber.fontColor = SKColor.black
        rangeNumber.fontSize = 20
        self.addChild(rangeNumber)
        
        let circlePlusRange = SKShapeNode(circleOfRadius: 10)
        circlePlusRange.position = CGPoint(x: 150, y: 347)
        circlePlusRange.fillColor = SKColor.black
        self.addChild(circlePlusRange)
        
        let plusRange = SKLabelNode(text: "+")
        plusRange.position = CGPoint(x: 150, y: 340)
        plusRange.name = "plusRange"
        plusRange.fontName = "HelveticaNueue-Bold"
        plusRange.fontColor = SKColor.white
        plusRange.fontSize = 20
        self.addChild(plusRange)
        
        
        
        
        
        let seatsLabel = SKLabelNode(text: "Seats")
        seatsLabel.position = CGPoint(x: 100, y: 300)
        seatsLabel.fontColor = SKColor.black
        seatsLabel.fontName = "HelveticaNueue-Bold"
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        let circleMinusSeats = SKShapeNode(circleOfRadius: 10)
        circleMinusSeats.position = CGPoint(x: 50, y: 277)
        circleMinusSeats.fillColor = SKColor.black
        self.addChild(circleMinusSeats)
        
        let minusSeats = SKLabelNode(text: "-")
        minusSeats.position = CGPoint(x: 50, y: 270)
        minusSeats.name = "minusSeats"
        minusSeats.fontName = "HelveticaNueue-Bold"
        minusSeats.fontColor = SKColor.white
        minusSeats.fontSize = 20.0
        self.addChild(minusSeats)
        
        let seatsNumber = SKLabelNode(text: String(miles))
        seatsNumber.position = CGPoint(x: 100, y: 270)
        seatsNumber.fontColor = SKColor.black
        seatsNumber.fontSize = 20
        self.addChild(seatsNumber)
        
        let circlePlusSeats = SKShapeNode(circleOfRadius: 10)
        circlePlusSeats.position = CGPoint(x: 150, y: 277)
        circlePlusSeats.fillColor = SKColor.black
        self.addChild(circlePlusSeats)
        
        let plusSeats = SKLabelNode(text: "+")
        plusSeats.position = CGPoint(x: 150, y: 270)
        plusSeats.name = "plusSeats"
        plusSeats.fontName = "HelveticaNueue-Bold"
        plusSeats.fontColor = SKColor.white
        plusSeats.fontSize = 20
        self.addChild(plusSeats)
        
    }
    
    
    func CarImage(image : SKNode){
        
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



var frame = CGRect(x: 0, y: 0, width: 500, height: 500)
frame = CGRect(x: 0, y: 0, width: 700, height: 510)

let skView = SKView(frame: frame)
skView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]


let scene = Results(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
