import UIKit
import PlaygroundSupport
import SpriteKit


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
    
    
    var budget = 100000
    var seatsNeeded = 5
    var dailyMiles = 100
    let lengthOfOwnership : Float = 5
    let gasAverage : Float = 3.0
    let mpgaverage : Float = 25.0
    
    var acceptedCounter = 0
    
    var showingFilter : Bool = false
    
    var sortStyle = 0
    
    
    var tableView: UITableView!
    var items = ["", "Best Value", "Price Low to High", "Price High to Low", "Range Low to High", "Range High to Low"]
    
    var arrowImage = SKSpriteNode()
    
    var budgetNumber = SKLabelNode()
    var milesNumber = SKLabelNode()
    var seatsNumber = SKLabelNode()

    
    
    var backgroundBox = SKShapeNode()
    var image = SKSpriteNode()
    var carNameLabel = SKLabelNode()
    var carPriceLabel = SKLabelNode()
    var carRangeLabel = SKLabelNode()
    
    
    var backgroundBoxArray : [SKShapeNode] = []
    var imageArray : [SKSpriteNode] = []
    var carNameLabelArray : [SKLabelNode] = []
    var carPriceLabelArray : [SKLabelNode] = []
    var carRangeLabelArray : [SKLabelNode] = []
    
    
    public override func didMove(to view: SKView) {
        
        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }

        let carScreen = SKShapeNode(rect: CGRect(x: 205, y: 5, width: 490, height: 500))
        carScreen.strokeColor = .red
        carScreen.fillColor = .red
        self.addChild(carScreen)
        
        algorithm()
        sortData()
        addCars()

        let backgroundBox = SKShapeNode(rect: CGRect(x: 5, y: 5, width: 200, height: 500))
        backgroundBox.fillColor = .gray
        backgroundBox.strokeColor = .gray
        self.addChild(backgroundBox)
        
        let budgetLabel = SKLabelNode(text: "Budget")
        budgetLabel.position = CGPoint(x: 100, y: 440)
        budgetLabel.fontColor = SKColor.black
        budgetLabel.fontName = "HelveticaNeue-Bold"
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        let circleMinusBudget = SKShapeNode(circleOfRadius: 10)
        circleMinusBudget.position = CGPoint(x: 50, y: 417)
        circleMinusBudget.fillColor = SKColor.black
        circleMinusBudget.name = "minusBudget"
        self.addChild(circleMinusBudget)
        
        let minusBudget = SKLabelNode(text: "-")
        minusBudget.position = CGPoint(x: 50, y: 410)
        minusBudget.name = "minusBudget"
        minusBudget.fontName = "HelveticaNeue-Bold"
        minusBudget.fontColor = SKColor.white
        minusBudget.fontSize = 20.0
        self.addChild(minusBudget)
        
        budgetNumber = SKLabelNode(text: String(budget))
        budgetNumber.position = CGPoint(x: 100, y: 410)
        budgetNumber.fontColor = SKColor.black
        budgetNumber.fontSize = 20
        self.addChild(budgetNumber)
        
        let circlePlusBudget = SKShapeNode(circleOfRadius: 10)
        circlePlusBudget.position = CGPoint(x: 150, y: 417)
        circlePlusBudget.fillColor = SKColor.black
        circlePlusBudget.name = "plusBudget"
        self.addChild(circlePlusBudget)
        
        let plusBudget = SKLabelNode(text: "+")
        plusBudget.position = CGPoint(x: 150, y: 410)
        plusBudget.name = "plusBudget"
        plusBudget.fontName = "HelveticaNeue-Bold"
        plusBudget.fontColor = SKColor.white
        plusBudget.fontSize = 20
        self.addChild(plusBudget)
        
        
        
        
        let rangeLabel = SKLabelNode(text: "Range")
        rangeLabel.position = CGPoint(x: 100, y: 370)
        rangeLabel.fontColor = SKColor.black
        rangeLabel.fontName = "HelveticaNeue-Bold"
        rangeLabel.fontSize = 18.0
        self.addChild(rangeLabel)
        
        let circleMinusRange = SKShapeNode(circleOfRadius: 10)
        circleMinusRange.position = CGPoint(x: 50, y: 347)
        circleMinusRange.name = "minusMiles"
        circleMinusRange.fillColor = SKColor.black
        self.addChild(circleMinusRange)
        
        let minusRange = SKLabelNode(text: "-")
        minusRange.position = CGPoint(x: 50, y: 340)
        minusRange.fontName = "HelveticaNeue-Bold"
        minusRange.name = "minusMiles"
        minusRange.fontColor = SKColor.white
        minusRange.fontSize = 20.0
        self.addChild(minusRange)
        
        milesNumber = SKLabelNode(text: String(dailyMiles))
        milesNumber.position = CGPoint(x: 100, y: 340)
        milesNumber.fontColor = SKColor.black
        milesNumber.fontSize = 20
        self.addChild(milesNumber)
        
        let circlePlusRange = SKShapeNode(circleOfRadius: 10)
        circlePlusRange.position = CGPoint(x: 150, y: 347)
        circlePlusRange.fillColor = SKColor.black
        circlePlusRange.name = "plusMiles"
        self.addChild(circlePlusRange)
        
        let plusRange = SKLabelNode(text: "+")
        plusRange.position = CGPoint(x: 150, y: 340)
        plusRange.fontName = "HelveticaNeue-Bold"
        plusRange.name = "plusMiles"
        plusRange.fontColor = SKColor.white
        plusRange.fontSize = 20
        self.addChild(plusRange)
        
        
        
        
        
        let seatsLabel = SKLabelNode(text: "Seats")
        seatsLabel.position = CGPoint(x: 100, y: 300)
        seatsLabel.fontColor = SKColor.black
        seatsLabel.fontName = "HelveticaNeue-Bold"
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        let circleMinusSeats = SKShapeNode(circleOfRadius: 10)
        circleMinusSeats.position = CGPoint(x: 50, y: 277)
        circleMinusSeats.fillColor = SKColor.black
        circleMinusSeats.name = "minusSeats"
        self.addChild(circleMinusSeats)
        
        let minusSeats = SKLabelNode(text: "-")
        minusSeats.position = CGPoint(x: 50, y: 270)
        minusSeats.name = "minusSeats"
        minusSeats.fontName = "HelveticaNeue-Bold"
        minusSeats.fontColor = SKColor.white
        minusSeats.fontSize = 20.0
        self.addChild(minusSeats)
        
        seatsNumber = SKLabelNode(text: String(seatsNeeded))
        seatsNumber.position = CGPoint(x: 100, y: 270)
        seatsNumber.fontColor = SKColor.black
        seatsNumber.fontSize = 20
        self.addChild(seatsNumber)
        
        let circlePlusSeats = SKShapeNode(circleOfRadius: 10)
        circlePlusSeats.position = CGPoint(x: 150, y: 277)
        circlePlusSeats.fillColor = SKColor.black
        circlePlusSeats.name = "plusSeats"
        self.addChild(circlePlusSeats)
        
        let plusSeats = SKLabelNode(text: "+")
        plusSeats.position = CGPoint(x: 150, y: 270)
        plusSeats.name = "plusSeats"
        plusSeats.fontName = "HelveticaNeue-Bold"
        plusSeats.fontColor = SKColor.white
        plusSeats.fontSize = 20
        self.addChild(plusSeats)
        
        
        let filterBy = SKLabelNode(text: "Filter By:")
        filterBy.position = CGPoint(x: 600, y: 515)
        filterBy.name = "filterBy"
        filterBy.fontName = "HelveticaNeue-Bold"
        filterBy.fontColor = SKColor.green
        filterBy.fontSize = 20
        self.addChild(filterBy)
        
        
        
        self.tableView = UITableView(frame:CGRect(x: 498, y: 38, width: 160, height: 145))
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView!.allowsSelection = true
        self.tableView.isHidden = true
        self.tableView.alwaysBounceVertical = false
        self.view?.addSubview(self.tableView)

        
        
        arrowImage = SKSpriteNode(imageNamed: "arrow.png")
        arrowImage.position = CGPoint(x: 620, y: 505)
        arrowImage.size = CGSize(width: 30, height: 30)
        arrowImage.isHidden = true
        self.addChild(arrowImage)
        

    }
    func algorithm() {
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

                let carCost : Float = Float(car.carPrice)!
                let maintenance : Float = Float(car.maintenance)! * Float(lengthOfOwnership)
                let gasCost : Float = (Float(dailyMiles)/mpgaverage) * gasAverage * lengthOfOwnership
                
                let year : Float = Float(dailyMiles * 365)
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
    func removeCars() {
        for x in 0...backgroundBoxArray.count-1 {
            backgroundBoxArray[x].removeFromParent()
            imageArray[x].removeFromParent()
            carNameLabelArray[x].removeFromParent()
            carPriceLabelArray[x].removeFromParent()
            carRangeLabelArray[x].removeFromParent()
        }
        backgroundBoxArray = []
        imageArray = []
        carNameLabelArray = []
        carPriceLabelArray = []
        carRangeLabelArray = []

    }
    func addCars() {
        if(backgroundBoxArray.count != 0) {
            removeCars()
        }

        for x in 0...acceptedVehicles.count-1 {
            
            backgroundBox = SKShapeNode(rect: CGRect(x: 250, y: 385 - 110*x, width: 420, height: 90))
            backgroundBox.fillColor = .white
            self.addChild(backgroundBox)
            
            let imageName = acceptedVehicles[x].carName + ".png"
            image = SKSpriteNode(imageNamed: imageName)
            image.position = CGPoint(x: 300, y: 435 - 110*x)
            image.size = CGSize(width: 100, height: 100)
            self.addChild(image)
            
            carNameLabel = SKLabelNode(text: acceptedVehicles[x].carName)
            carNameLabel.position = CGPoint(x: 400, y: 435 - 110*x)
            carNameLabel.fontColor = .black
            carNameLabel.fontSize = 15.0
            self.addChild(carNameLabel)
            
            var carPriceString = "$" + acceptedVehicles[x].carPrice
            carPriceString.insert(",", at: carPriceString.index(carPriceString.startIndex, offsetBy: 3))
            
            carPriceLabel = SKLabelNode(text: carPriceString)
            carPriceLabel.position = CGPoint(x: 600, y: 435 - 110*x)
            carPriceLabel.fontColor = .black
            carPriceLabel.fontSize = 15.0
            self.addChild(carPriceLabel)
            
            
            let rangeString = "Range: " + acceptedVehicles[x].carRange + " miles"
            carRangeLabel = SKLabelNode(text: rangeString)
            carRangeLabel.position = CGPoint(x: 410, y: 400 - 110*x)
            carRangeLabel.fontColor = .black
            carRangeLabel.fontSize = 15.0
            self.addChild(carRangeLabel)
            
            backgroundBoxArray.append(backgroundBox)
            imageArray.append(image)
            carNameLabelArray.append(carNameLabel)
            carPriceLabelArray.append(carPriceLabel)
            carRangeLabelArray.append(carRangeLabel)

            
        }
    }
    
    func sortData() {
        if(sortStyle == 1) {
            var integerArray : [Float] = []
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
        cell.textLabel?.font = UIFont(name:"Arial", size:15)
        cell.textLabel?.textAlignment = .left
        
        if(cell.textLabel?.text == "") {
            cell.textLabel?.text = "Filter By:"
            cell.textLabel?.font = UIFont(name:"Helvetica-Bold", size:15)
            cell.backgroundColor = .gray
            
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
        sortData()
        addCars()
    }
    
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        
        if let name = touchedNode.name {
            if name == "filterBy" {
                if(showingFilter == false) {
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
            
            if name == "minusBudget" && budget > 30000 {
                budget = budget - 5000
                self.budgetNumber.text = String(budget)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
            }
            else if name == "plusBudget" && budget < 150000 {
                budget = budget + 5000
                self.budgetNumber.text = String(budget)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
            }
                
            else if name == "minusMiles" && dailyMiles > 0 {
                dailyMiles = dailyMiles - 5
                self.milesNumber.text = String(dailyMiles)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
            }
            else if name == "plusMiles" && dailyMiles < 350 {
                dailyMiles = dailyMiles + 5
                self.milesNumber.text = String(dailyMiles)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
                acceptedVehicles
            }
                
            else if name == "minusSeats" && seatsNeeded > 4 {
                seatsNeeded = seatsNeeded - 1
                self.seatsNumber.text = String(seatsNeeded)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
            }
            else if name == "plusSeats" && seatsNeeded < 7 {
                seatsNeeded = seatsNeeded + 1
                self.seatsNumber.text = String(seatsNeeded)
                acceptedCounter = 0
                acceptedVehicles = []
                algorithm()
                sortData()
                addCars()
            }
        }
        else if (showingFilter == true) {
            self.arrowImage.isHidden = true
            self.tableView?.isHidden = true
            showingFilter = false
        }
    }
}


var frame = CGRect(x: 0, y: 0, width: 500, height: 500)
frame = CGRect(x: 0, y: 0, width: 700, height: 540)

let skView = SKView(frame: frame)
skView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]


let scene = Results(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
