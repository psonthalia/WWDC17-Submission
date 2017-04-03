//: Playground - noun: a place where people can play

import PlaygroundSupport
import SpriteKit
//
//class Car {
//    var carName: String = String()
//    var carPrice: String = String()
//    var carRange: String = String()
//    var seats4 : String = String()
//    var seats5 : String = String()
//    var seats6 : String = String()
//    var seats7 : String = String()
//}
//
//
//class HomeViewController : UIViewController, XMLParserDelegate {
//    var startButton : UIButton!
//
//    var cars: [Car] = []
//    var eName: String = String()
//    var carName = String()
//    var carPrice = String()
//    var carRange = String()
//    var seats4 = String()
//    var seats5 = String()
//    var seats6 = String()
//    var seats7 = String()
//
//    override func loadView() {
//
//        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
//            if let parser = XMLParser(contentsOf: path) {
//                parser.delegate = self
//                parser.parse()
//            }
//        }
//
////: How to get data from XML
//        let car = cars[0]
//        print(car.seats4)
//
//    }
//
////    func nextScreen() {
////        let detail = FormViewController()
////        navigationController?.pushViewController(detail, animated: true)
////    }
//
//
////: XMLParser delegate methods
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        eName = elementName
//        if elementName == "item" {
//            carName = String()
//            carPrice = String()
//            carRange = String()
//            seats4 = String()
//            seats5 = String()
//            seats6 = String()
//            seats7 = String()
//        }
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "item" {
//
//            let car = Car()
//            car.carName = carName
//            car.carPrice = carPrice
//            car.carRange = carRange
//            car.seats4 = seats4
//            car.seats5 = seats5
//            car.seats6 = seats6
//            car.seats7 = seats7
//
//            cars.append(car)
//        }
//    }
//
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//        if (!data.isEmpty) {
//            if eName == "name" {
//                carName += data
//            } else if eName == "price" {
//                carPrice += data
//            } else if eName == "seat4" {
//                seats4 += data
//            } else if eName == "seat5" {
//                seats5 += data
//            } else if eName == "seat6" {
//                seats6 += data
//            } else if eName == "seat7" {
//                seats7 += data
//            } else if eName == "range" {
//                carRange += data
//            }
//        }
//        seats4
//    }
//}

class Test : SKScene {
    
    override func sceneDidLoad() {
        let frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        
        let view = SKScene(size: frame.size)
        
        view.backgroundColor = .white
        
                    let image = UIImage(named: "4877.png")
        let nyanCat = SKSpriteNode(imageNamed: "4877.png")
        nyanCat.position = midPoint
                    var imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
        let Texture = SKTexture(image: image!)
        let Sprite = SKSpriteNode(texture:Texture)
        
        view.addChild(Sprite)
        view.addChild(nyanCat)
    }
}
let frame = CGRect(x: 0, y: 0, width: 500, height: 500)

let view5 = SKView(frame: frame)
view5.presentScene(Test().scene)
PlaygroundPage.current.liveView = view5


//let view:SKView = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//view.backgroundColor = .white
//
//let scene:SKScene = SKScene(size: CGSize(width: 500, height: 500))
//scene.scaleMode = SKSceneScaleMode.aspectFit
//view.presentScene(scene)
//
////let startButton = UIButton(type: .system)
////startButton.frame = CGRect(x: 300, y: 400, width: 50, height: 10)
////startButton.tintColor = .blue
////startButton.setTitle("Next", for:.normal)
////view.addSubview(startButton)
//
//
//let budgetLabel = UILabel()
//budgetLabel.frame = CGRect(x: 10, y: 50, width: 300, height: 20)
//budgetLabel.text = "What is your budget?"
//view.addSubview(budgetLabel)
//
//let k30 = UIButton(type: .system)
//let k50 = UIButton(type: .system)
//let k70 = UIButton(type: .system)
//let k100 = UIButton(type: .system)
//let plus = UIButton(type: .system)
//
//k30.frame = CGRect(x: 10, y: 90, width: 50, height: 10)
//k50.frame = CGRect(x: 70, y: 90, width: 50, height: 10)
//k70.frame = CGRect(x: 130, y: 90, width: 50, height: 10)
//k100.frame = CGRect(x: 190, y: 90, width: 50, height: 10)
//plus.frame = CGRect(x: 250, y: 90, width: 100, height: 10)
//
//k30.tintColor = .blue
//k50.tintColor = .blue
//k70.tintColor = .blue
//k100.tintColor = .blue
//plus.tintColor = .blue
//
//k30.setTitle("< 30k", for:.normal)
//k50.setTitle("< 50k", for:.normal)
//k70.setTitle("< 70k", for:.normal)
//k100.setTitle("< 100k", for:.normal)
//plus.setTitle("< Over 100k", for:.normal)
//
//view.addSubview(k30)
//view.addSubview(k50)
//view.addSubview(k70)
//view.addSubview(k100)
//view.addSubview(plus)
//
//
////: Setting up miles questions
//
//let milesDailyLabel = UILabel()
//milesDailyLabel.frame = CGRect(x: 10, y: 120, width: 370, height: 20)
//milesDailyLabel.text = "How many miles do you drive daily?"
//view.addSubview(milesDailyLabel)
//
//let milesDailyTextField = UITextField()
//milesDailyTextField.frame = CGRect(x: 380, y: 120, width: 50, height: 20)
//milesDailyTextField.borderStyle = .roundedRect
//milesDailyTextField.keyboardType = UIKeyboardType.numberPad
//view.addSubview(milesDailyTextField)
//
//
//let milesYearlyLabel = UILabel()
//milesYearlyLabel.frame = CGRect(x: 10, y: 150, width: 370, height: 20)
//milesYearlyLabel.text = "How many miles do you drive per year?"
//view.addSubview(milesYearlyLabel)
//
//let milesYearlyTextField = UITextField()
//milesYearlyTextField.frame = CGRect(x: 380, y: 150, width: 50, height: 20)
//milesYearlyTextField.borderStyle = .roundedRect
//milesYearlyTextField.keyboardType = UIKeyboardType.numberPad
//view.addSubview(milesYearlyTextField)
//
////: Setting up the seats question
//
//let seatsLabel = UILabel()
//seatsLabel.frame = CGRect(x: 10, y: 180, width: 400, height: 70)
//seatsLabel.text = "How many seats do you need? (You can select multiple)"
//seatsLabel.numberOfLines = 0
//view.addSubview(seatsLabel)
//
//let seats4 = UIButton(type: .system)
//let seats5 = UIButton(type: .system)
//let seats6 = UIButton(type: .system)
//let seats7 = UIButton(type: .system)
//
//seats4.frame = CGRect(x: 10, y: 250, width: 50, height: 10)
//seats5.frame = CGRect(x: 70, y: 250, width: 50, height: 10)
//seats6.frame = CGRect(x: 130, y: 250, width: 50, height: 10)
//seats7.frame = CGRect(x: 190, y: 250, width: 50, height: 10)
//
//seats4.tintColor = .blue
//seats5.tintColor = .blue
//seats6.tintColor = .blue
//seats7.tintColor = .blue
//
//seats4.setTitle("4", for:.normal)
//seats5.setTitle("5", for:.normal)
//seats6.setTitle("6", for:.normal)
//seats7.setTitle("7", for:.normal)
//
//view.addSubview(seats4)
//view.addSubview(seats5)
//view.addSubview(seats6)
//view.addSubview(seats7)
//
////: Next Button
//let nextButton = UIButton(type: .system)
//nextButton.frame = CGRect(x: 300, y: 500, width: 50, height: 10)
//nextButton.tintColor = .blue
//nextButton.setTitle("Next", for:.normal)
//view.addSubview(nextButton)

//if let view = self.sceneView as SKView? {
//    // Load the SKScene from 'GameScene.sks'
//    if let scene = SKScene(fileNamed: "GameScene") {
//        // Set the scale mode to scale to fit the window
//        scene.scaleMode = .aspectFill
//        
//        // Present the scene
//        view.presentScene(scene)
//    }
//    
//    view.ignoresSiblingOrder = true
//    
//    
//}




//class FormViewController : UIViewController {
//    
//    var milesDailyTextField : UITextField!
//    var milesYearlyTextField : UITextField!
//
//    var budgetLabel : UILabel!
//    var milesDailyLabel : UILabel!
//    var seatsLabel : UILabel!
//    var milesYearlyLabel : UILabel!
//
//    var k30 : UIButton!
//    var k50 : UIButton!
//    var k70 : UIButton!
//    var k100 : UIButton!
//    var plus : UIButton!
//    var seats4 : UIButton!
//    var seats5 : UIButton!
//    var seats6 : UIButton!
//    var seats7 : UIButton!
//    var nextButton : UIButton!
//
//    
//    var price = 0
//    var s4 = false
//    var s5 = false
//    var s6 = false
//    var s7 = false
//    var milesDaily:Int? = 0
//    var milesYearly:Int? = 0
//
//
//    override func loadView() {
//        
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//        
//        view.backgroundColor = .white
//        
//        let image = UIImage(named: "4877.jpg")
//        let imageView = UIImageView(image: image)
//        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
//        view.addSubview(imageView)
//        
////: Setting the question for budget
//        
//
//
//        
//        self.view = view
//    }
//    
//    func k30Selected() {
//        if k30.isSelected == false {
//            k30.isSelected = true
//            k50.isSelected = false
//            k70.isSelected = false
//            k100.isSelected = false
//            plus.isSelected = false
//        }
//        else {
//            k30.isSelected = false
//        }
//
//    }
//    func k50Selected() {
//        if k50.isSelected == false {
//            k30.isSelected = false
//            k50.isSelected = true
//            k70.isSelected = false
//            k100.isSelected = false
//            plus.isSelected = false
//        }
//        else {
//            k50.isSelected = false
//        }
//    }
//    func k70Selected() {
//        if k70.isSelected == false {
//            k30.isSelected = false
//            k50.isSelected = false
//            k70.isSelected = true
//            k100.isSelected = false
//            plus.isSelected = false
//        }
//        else {
//            k70.isSelected = false
//        }
//    }
//    func k100Selected() {
//        if k100.isSelected == false {
//            k30.isSelected = false
//            k50.isSelected = false
//            k70.isSelected = false
//            k100.isSelected = true
//            plus.isSelected = false
//        }
//        else {
//            k100.isSelected = false
//        }
//    }
//    func plusSelected() {
//        if plus.isSelected == false {
//            k30.isSelected = false
//            k50.isSelected = false
//            k70.isSelected = false
//            k100.isSelected = false
//            plus.isSelected = true
//        }
//        else {
//            plus.isSelected = false
//        }
//    }
//    
//    func seat4Selected() {
//        if seats4.isSelected == true {
//            seats4.isSelected = false
//        }
//        else {
//            seats4.isSelected = true
//        }
//    }
//    func seat5Selected() {
//        if seats5.isSelected == true {
//            seats5.isSelected = false
//        }
//        else {
//            seats5.isSelected = true
//        }
//    }
//    func seat6Selected() {
//        if seats6.isSelected == true {
//            seats6.isSelected = false
//        }
//        else {
//            seats6.isSelected = true
//        }
//    }
//    func seat7Selected() {
//        if seats7.isSelected == true {
//            seats7.isSelected = false
//        }
//        else {
//            seats7.isSelected = true
//        }
//    }
//    
//    func nextScreen() {
//        if k30.isSelected == true {
//            price = 30
//        }
//        else if k50.isSelected == true {
//            price = 50
//        }
//        else if k70.isSelected == true {
//            price = 70
//        }
//        else if k100.isSelected == true {
//            price = 100
//        }
//        else if plus.isSelected == true {
//            price = 110
//        }
//        
//        if seats4.isSelected == true {
//            s4 = true
//        }
//        if seats5.isSelected == true {
//            s5 = true
//        }
//        if seats6.isSelected == true {
//            s6 = true
//        }
//        if seats7.isSelected == true {
//            s7 = true
//        }
//        
//        milesDaily = Int(milesDailyTextField.text!)
//        milesYearly = Int(milesYearlyTextField.text!)
//
//
//    }
//    
//    
//}
