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
    
    
    public override func didMove(to view: SKView) {
        
        self.view?.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = true
        
        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        
        let carScreen = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 700, height: 390))
        carScreen.strokeColor = #colorLiteral(red: 0.2235294118, green: 0.662745098, blue: 0.8588235294, alpha: 1)
        carScreen.fillColor = #colorLiteral(red: 0.2235294118, green: 0.662745098, blue: 0.8588235294, alpha: 1)
        self.addChild(carScreen)

        let backgroundBox = SKShapeNode(rect: CGRect(x: 0, y: 390, width: 700, height: 150))
        backgroundBox.fillColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.2156862745, alpha: 1)
        backgroundBox.strokeColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.2156862745, alpha: 1)
        self.addChild(backgroundBox)
        
        
        let budgetLabel = SKLabelNode(text: "Budget")
        budgetLabel.position = CGPoint(x: 120, y: 510)
        budgetLabel.fontColor = .black
        budgetLabel.fontName = "HelveticaNeue-Bold"
        budgetLabel.fontSize = 18.0
        self.addChild(budgetLabel)
        
        budgetSlider = UISlider(frame:CGRect(x: 30, y: 50, width: 180, height: 20))
        budgetSlider.minimumValue = 25000
        budgetSlider.maximumValue = 90000
        budgetSlider.isContinuous = true
        budgetSlider.tintColor = .blue
        budgetSlider.value = 90000
        budgetSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        budgetSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        budgetSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(budgetSlider)
        
        budgetValue = SKLabelNode(text: "$" + String(Int(budgetSlider.value)))
        budgetValue.position = CGPoint(x: 120, y: 420)
        budgetValue.fontColor = SKColor.black
        budgetValue.horizontalAlignmentMode = .center
        budgetValue.fontName = "HelveticaNeue-Bold"
        budgetValue.fontSize = 18.0
        self.addChild(budgetValue)
        
        let rangeLabel = SKLabelNode(text: "Range")
        rangeLabel.position = CGPoint(x: 350, y: 510)
        rangeLabel.fontColor = SKColor.black
        rangeLabel.fontName = "HelveticaNeue-Bold"
        rangeLabel.fontSize = 18.0
        self.addChild(rangeLabel)
        
        rangeSlider = UISlider(frame:CGRect(x: 260, y: 50, width: 180, height: 20))
        rangeSlider.minimumValue = 50
        rangeSlider.maximumValue = 240
        rangeSlider.isContinuous = true
        rangeSlider.tintColor = .blue
        rangeSlider.value = 100
        rangeSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        rangeSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        rangeSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(rangeSlider)
        
        rangeValue = SKLabelNode(text: String(Int(rangeSlider.value)) + " miles")
        rangeValue.position = CGPoint(x: 350, y: 420)
        rangeValue.fontColor = SKColor.black
        rangeValue.horizontalAlignmentMode = .center
        rangeValue.fontName = "HelveticaNeue-Bold"
        rangeValue.fontSize = 18.0
        self.addChild(rangeValue)
        
        
        let seatsLabel = SKLabelNode(text: "Seats")
        seatsLabel.position = CGPoint(x: 580, y: 510)
        seatsLabel.fontColor = SKColor.black
        seatsLabel.fontName = "HelveticaNeue-Bold"
        seatsLabel.fontSize = 18.0
        self.addChild(seatsLabel)
        
        seatsSlider = UISlider(frame:CGRect(x: 490, y: 50, width: 180, height: 20))
        seatsSlider.minimumValue = 4
        seatsSlider.maximumValue = 7
        seatsSlider.isContinuous = true
        seatsSlider.tintColor = .blue
        seatsSlider.value = 5
        seatsSlider.addTarget(self, action: #selector(Results.sliderValueChanged), for: UIControlEvents.valueChanged)
        seatsSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpOutside)
        seatsSlider.addTarget(self, action: #selector(Results.updateData), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(seatsSlider)
        
        seatsValue = SKLabelNode(text: String(Int(seatsSlider.value)))
        seatsValue.position = CGPoint(x: 580, y: 420)
        seatsValue.fontColor = SKColor.black
        seatsValue.horizontalAlignmentMode = .center
        seatsValue.fontName = "HelveticaNeue-Bold"
        seatsValue.fontSize = 18.0
        self.addChild(seatsValue)
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.frame = CGRect(x: self.size.width/2, y: self.size.height/2, width: 0, height: 0)
        self.view?.addSubview(activityIndicator)
        
        
        let filterBy = SKLabelNode(text: "Filter By")
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
        
        clickForCarsBg = SKShapeNode(rect: CGRect(x: 150, y:10, width: 400, height: 20), cornerRadius: 2)
        clickForCarsBg.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        clickForCarsBg.fillColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addChild(clickForCarsBg)
        
        clickForCarsLabel = SKLabelNode(text: "Click on each car for more information")
        clickForCarsLabel.color = .white
        clickForCarsLabel.position = CGPoint(x: 350, y: 12)
        clickForCarsLabel.fontSize = 18
        clickForCarsLabel.fontName = "HelveticaNeue-Bold"
        self.addChild(clickForCarsLabel)
        
        noFit = SKLabelNode(text: "No cars match your search,")
        noFit.position = CGPoint(x: 350, y: 225)
        noFit.horizontalAlignmentMode = .center
        noFit.fontName = "HelveticaNeue-Bold"
        noFit.fontColor = .black
        noFit.fontSize = 35.0
        self.addChild(noFit)
        
        noFit2 = SKLabelNode(text: "please update your needs above")
        noFit2.position = CGPoint(x: 350, y: 175)
        noFit2.fontName = "HelveticaNeue-Bold"
        noFit2.fontColor = .black
        noFit2.fontSize = 35.0
        self.addChild(noFit2)
        
        algorithm()
        sortData()
        addCars()
        
//        DispatchQueue.main.async {
//
//        self.loadingIcon = SKSpriteNode(imageNamed: "loading.png")
//        self.loadingIcon.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
//        self.loadingIcon.size = CGSize(width: 50, height: 50)
//        var action = SKAction.rotate(byAngle: -1, duration: 0.5)
//        action = SKAction.repeatForever(action)
//        self.loadingIcon.run(action)
//        self.addChild(self.loadingIcon)
//        }
        
        
        
//        loadingIcon.isHidden = true
        
        

    }
    func sliderValueChanged() {
        let rounded = Int(budgetSlider.value) / 1000 * 1000
        budgetValue.text = "$" + String(rounded)
        rangeValue.text = String(Int(rangeSlider.value)) + " miles"
        seatsValue.text = String(Int(seatsSlider.value))
    }
    func updateData() {
//        DispatchQueue.global(qos: .background).async {
//            print("This is run on the background queue")
//            
//            
//            DispatchQueue.main.async {
//                print("This is run on the main queue, after the previous code in outer block")
//            }
//        }
        
        
        
        
        
        DispatchQueue.main.async {
//            self.loadingIcon.isHidden = false
            self.activityIndicator.startAnimating()

            DispatchQueue.main.async {
                self.refreshCars()
            }
        }
    }
    func refreshCars() {
        acceptedCounter = 0
        acceptedVehicles = []
        algorithm()
        sortData()
        addCars()
    }
    func algorithm() {
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
        
    }
    func removeCars() {
        for x in 0...containerArray.count-1 {
            frontViewArray[x].removeFromSuperview()
            backViewArray[x].removeFromSuperview()
            containerArray[x].removeFromSuperview()
        }
        frontViewArray = []
        backViewArray = []
        containerArray = []
    }
    func addCars() {
        if(containerArray.count != 0) {
            removeCars()
        }
        print(acceptedVehicles.count)
        if(acceptedVehicles.count-1 > 0) {
            for x in 0...acceptedVehicles.count-1 {
                
                var xcoord = 0
                var y = 380
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
                frontView.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)
                let imageView = UIImageView(image: imageN)
                imageView.frame = CGRect(x: 20, y: -10, width: 100, height: 100)
                frontView.addSubview(imageView)
                
                let carName = UILabel(frame: CGRect(x: 0, y: 100, width: 140, height: 20))
                carName.textAlignment = .center
                carName.text = acceptedVehicles[x].carName
                carName.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
                carName.adjustsFontSizeToFitWidth = true
                frontView.addSubview(carName)
                
                
                backView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 130))
                backView.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.4666666667, blue: 0.7647058824, alpha: 1)

                let carName2 = UILabel(frame: CGRect(x: 0, y: 10, width: 140, height: 20))
                carName2.textAlignment = .center
                carName2.text = acceptedVehicles[x].carName
                carName2.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
                carName2.adjustsFontSizeToFitWidth = true
                backView.addSubview(carName2)
                
                
                let carPrice = UILabel(frame: CGRect(x: 0, y: 50, width: 140, height: 20))
                carPrice.textAlignment = .center
                carPrice.text = "$" + acceptedVehicles[x].carPrice
                carPrice.adjustsFontSizeToFitWidth = true
                backView.addSubview(carPrice)
                
                let carRange = UILabel(frame: CGRect(x: 0, y: 100, width: 140, height: 20))
                carRange.textAlignment = .center
                carRange.text = acceptedVehicles[x].carRange + " miles"
                carRange.adjustsFontSizeToFitWidth = true
                backView.addSubview(carRange)
                
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
            noFit.isHidden = true
            noFit2.isHidden = true
        }
        else {
            clickForCarsLabel.isHidden = true
            clickForCarsBg.isHidden = true
            noFit.isHidden = false
            noFit2.isHidden = false
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        for x in 0...frontViewArray.count-1 {
            if frontViewArray[x].tag == sender.view!.tag {
                let v1 = (flipBool[x] ? self.frontViewArray[x] : self.backViewArray[x])
                let v2 = (flipBool[x] ? self.backViewArray[x] : self.frontViewArray[x])
                let options: UIViewAnimationOptions = [.transitionFlipFromLeft, .curveEaseInOut]
                
                UIView.transition(from: v1, to: v2, duration: 0.5, options: options) { finished in
                    
                    self.flipBool[x] = !self.flipBool[x]
                    print("2/fromOneToTwo \(self.flipBool[x]) ")
                }
            }
        }
    }
    
    func sortData() {
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
    
    
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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

var frame = CGRect(x: 0, y: 0, width: 500, height: 500)
frame = CGRect(x: 0, y: 0, width: 700, height: 540)

let skView = SKView(frame: frame)
skView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]


let scene = Results(size: frame.size)
scene.scaleMode = .aspectFit


skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
