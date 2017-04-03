//: Playground - noun: a place where people can play

import PlaygroundSupport
import SpriteKit

class ParentView: UIViewController {
    override func loadView() {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
        view.backgroundColor = .white
        
        view.addSubview(FormViewController().view)
        self.view = view

    }
    
}


class Car {
    var carName: String = String()
    var carPrice: String = String()
    var carRange: String = String()
    var seats4 : String = String()
    var seats5 : String = String()
    var seats6 : String = String()
    var seats7 : String = String()
}

class HomeViewController : UIViewController, XMLParserDelegate {
    var startButton : UIButton!
    
    var cars: [Car] = []
    var eName: String = String()
    var carName = String()
    var carPrice = String()
    var carRange = String()
    var seats4 = String()
    var seats5 = String()
    var seats6 = String()
    var seats7 = String()

    override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        view.backgroundColor = .white
        
        startButton = UIButton(type: .system)
        startButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        startButton.frame = CGRect(x: 300, y: 500, width: 50, height: 10)
        startButton.tintColor = .blue
        startButton.setTitle("Next", for:.normal)
        view.addSubview(startButton)
        
        self.view = view
        
        if let path = Bundle.main.url(forResource: "carData", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
//: How to get data from XML
        let car = cars[0]
        print(car.seats4)
        
    }
    
    func nextScreen() {
        let detail = FormViewController()
        navigationController?.pushViewController(detail, animated: true)
    }
    
    
//: XMLParser delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
        if elementName == "item" {
            carName = String()
            carPrice = String()
            carRange = String()
            seats4 = String()
            seats5 = String()
            seats6 = String()
            seats7 = String()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            
            let car = Car()
            car.carName = carName
            car.carPrice = carPrice
            car.carRange = carRange
            car.seats4 = seats4
            car.seats5 = seats5
            car.seats6 = seats6
            car.seats7 = seats7

            cars.append(car)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if eName == "name" {
                carName += data
            } else if eName == "price" {
                carPrice += data
            } else if eName == "seat4" {
                seats4 += data
            } else if eName == "seat5" {
                seats5 += data
            } else if eName == "seat6" {
                seats6 += data
            } else if eName == "seat7" {
                seats7 += data
            } else if eName == "range" {
                carRange += data
            }
        }
        seats4
    }
}



class FormViewController : UIViewController {
    
    var milesDailyTextField : UITextField!
    var milesYearlyTextField : UITextField!
    var howLongTextField : UITextField!

    var budgetLabel : UILabel!
    var milesDailyLabel : UILabel!
    var seatsLabel : UILabel!
    var milesYearlyLabel : UILabel!
    var howLongLabel : UILabel!

    var k30 : UIButton!
    var k50 : UIButton!
    var k70 : UIButton!
    var k100 : UIButton!
    var plus : UIButton!
    var seats4 : UIButton!
    var seats5 : UIButton!
    var seats6 : UIButton!
    var seats7 : UIButton!
    var nextButton : UIButton!

    
    var price = 0
    var s4 = false
    var s5 = false
    var s6 = false
    var s7 = false
    var milesDaily:Int? = 0
    var milesYearly:Int? = 0
    var howLong:Int? = 0


    override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        view.backgroundColor = .white
        
        let image = UIImage(named: "4877.jpg")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
        view.addSubview(imageView)
        
//: Setting the question for budget
        
        budgetLabel = UILabel()
        budgetLabel.frame = CGRect(x: 10, y: 50, width: 300, height: 20)
        budgetLabel.text = "What is your budget?"
        view.addSubview(budgetLabel)
        
        k30 = UIButton(type: .system)
        k50 = UIButton(type: .system)
        k70 = UIButton(type: .system)
        k100 = UIButton(type: .system)
        plus = UIButton(type: .system)
        
        k30.addTarget(self, action: #selector(k30Selected), for: .touchUpInside)
        k50.addTarget(self, action: #selector(k50Selected), for: .touchUpInside)
        k70.addTarget(self, action: #selector(k70Selected), for: .touchUpInside)
        k100.addTarget(self, action: #selector(k100Selected), for: .touchUpInside)
        plus.addTarget(self, action: #selector(plusSelected), for: .touchUpInside)

        k30.frame = CGRect(x: 10, y: 90, width: 50, height: 10)
        k50.frame = CGRect(x: 70, y: 90, width: 50, height: 10)
        k70.frame = CGRect(x: 130, y: 90, width: 50, height: 10)
        k100.frame = CGRect(x: 190, y: 90, width: 50, height: 10)
        plus.frame = CGRect(x: 250, y: 90, width: 100, height: 10)

        k30.tintColor = .blue
        k50.tintColor = .blue
        k70.tintColor = .blue
        k100.tintColor = .blue
        plus.tintColor = .blue

        k30.setTitle("< 30k", for:.normal)
        k50.setTitle("< 50k", for:.normal)
        k70.setTitle("< 70k", for:.normal)
        k100.setTitle("< 100k", for:.normal)
        plus.setTitle("< Over 100k", for:.normal)
        
        view.addSubview(k30)
        view.addSubview(k50)
        view.addSubview(k70)
        view.addSubview(k100)
        view.addSubview(plus)

        
//: Setting up miles questions
        
        milesDailyLabel = UILabel()
        milesDailyLabel.frame = CGRect(x: 10, y: 120, width: 275, height: 20)
        milesDailyLabel.text = "How many miles do you drive daily?"
        milesDailyLabel.numberOfLines = 0
        view.addSubview(milesDailyLabel)
        
        milesDailyTextField = UITextField()
        milesDailyTextField.frame = CGRect(x: 300, y: 120, width: 50, height: 20)
        milesDailyTextField.borderStyle = .roundedRect
        milesDailyTextField.keyboardType = UIKeyboardType.numberPad
        view.addSubview(milesDailyTextField)
        
        
        milesYearlyLabel = UILabel()
        milesYearlyLabel.frame = CGRect(x: 10, y: 150, width: 275, height: 20)
        milesYearlyLabel.text = "How many miles do you drive per year?"
        milesYearlyLabel.numberOfLines = 0
        view.addSubview(milesYearlyLabel)
        
        milesYearlyTextField = UITextField()
        milesYearlyTextField.frame = CGRect(x: 300, y: 150, width: 50, height: 20)
        milesYearlyTextField.borderStyle = .roundedRect
        milesYearlyTextField.keyboardType = UIKeyboardType.numberPad
        view.addSubview(milesYearlyTextField)
        
//: Setting up the seats question
        
        seatsLabel = UILabel()
        seatsLabel.frame = CGRect(x: 10, y: 180, width: 400, height: 70)
        seatsLabel.text = "How many seats do you need? (You can select multiple)"
        seatsLabel.numberOfLines = 0
        view.addSubview(seatsLabel)
        
        seats4 = UIButton(type: .system)
        seats5 = UIButton(type: .system)
        seats6 = UIButton(type: .system)
        seats7 = UIButton(type: .system)
        
        seats4.addTarget(self, action: #selector(seat4Selected), for: .touchUpInside)
        seats5.addTarget(self, action: #selector(seat5Selected), for: .touchUpInside)
        seats6.addTarget(self, action: #selector(seat6Selected), for: .touchUpInside)
        seats7.addTarget(self, action: #selector(seat7Selected), for: .touchUpInside)
        
        seats4.frame = CGRect(x: 10, y: 250, width: 50, height: 10)
        seats5.frame = CGRect(x: 70, y: 250, width: 50, height: 10)
        seats6.frame = CGRect(x: 130, y: 250, width: 50, height: 10)
        seats7.frame = CGRect(x: 190, y: 250, width: 50, height: 10)
        
        seats4.tintColor = .blue
        seats5.tintColor = .blue
        seats6.tintColor = .blue
        seats7.tintColor = .blue
        
        seats4.setTitle("4", for:.normal)
        seats5.setTitle("5", for:.normal)
        seats6.setTitle("6", for:.normal)
        seats7.setTitle("7", for:.normal)
        
        view.addSubview(seats4)
        view.addSubview(seats5)
        view.addSubview(seats6)
        view.addSubview(seats7)
        
//: How Long question
        howLongLabel = UILabel()
        howLongLabel.frame = CGRect(x: 10, y: 280, width: 275, height: 70)
        howLongLabel.text = "How long do you plan on owning the car for?"
        howLongLabel.numberOfLines = 0
        view.addSubview(howLongLabel)
        
        howLongTextField = UITextField()
        howLongTextField.frame = CGRect(x: 300, y: 300, width: 50, height: 20)
        howLongTextField.borderStyle = .roundedRect
        howLongTextField.keyboardType = UIKeyboardType.numberPad
        view.addSubview(howLongTextField)
        
        
//: Next Button
        nextButton = UIButton(type: .system)
        nextButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        nextButton.frame = CGRect(x: 300, y: 500, width: 50, height: 10)
        nextButton.tintColor = .blue
        nextButton.setTitle("Next", for:.normal)
        view.addSubview(nextButton)

        
        self.view = view
    }
    
    func k30Selected() {
        if k30.isSelected == false {
            k30.isSelected = true
            k50.isSelected = false
            k70.isSelected = false
            k100.isSelected = false
            plus.isSelected = false
        }
        else {
            k30.isSelected = false
        }

    }
    func k50Selected() {
        if k50.isSelected == false {
            k30.isSelected = false
            k50.isSelected = true
            k70.isSelected = false
            k100.isSelected = false
            plus.isSelected = false
        }
        else {
            k50.isSelected = false
        }
    }
    func k70Selected() {
        if k70.isSelected == false {
            k30.isSelected = false
            k50.isSelected = false
            k70.isSelected = true
            k100.isSelected = false
            plus.isSelected = false
        }
        else {
            k70.isSelected = false
        }
    }
    func k100Selected() {
        if k100.isSelected == false {
            k30.isSelected = false
            k50.isSelected = false
            k70.isSelected = false
            k100.isSelected = true
            plus.isSelected = false
        }
        else {
            k100.isSelected = false
        }
    }
    func plusSelected() {
        if plus.isSelected == false {
            k30.isSelected = false
            k50.isSelected = false
            k70.isSelected = false
            k100.isSelected = false
            plus.isSelected = true
        }
        else {
            plus.isSelected = false
        }
    }
    
    func seat4Selected() {
        if seats4.isSelected == true {
            seats4.isSelected = false
        }
        else {
            seats4.isSelected = true
        }
    }
    func seat5Selected() {
        if seats5.isSelected == true {
            seats5.isSelected = false
        }
        else {
            seats5.isSelected = true
        }
    }
    func seat6Selected() {
        if seats6.isSelected == true {
            seats6.isSelected = false
        }
        else {
            seats6.isSelected = true
        }
    }
    func seat7Selected() {
        if seats7.isSelected == true {
            seats7.isSelected = false
        }
        else {
            seats7.isSelected = true
        }
    }
    
    func nextScreen() {
        if k30.isSelected == true {
            price = 30
        }
        else if k50.isSelected == true {
            price = 50
        }
        else if k70.isSelected == true {
            price = 70
        }
        else if k100.isSelected == true {
            price = 100
        }
        else if plus.isSelected == true {
            price = 110
        }
        
        if seats4.isSelected == true {
            s4 = true
        }
        if seats5.isSelected == true {
            s5 = true
        }
        if seats6.isSelected == true {
            s6 = true
        }
        if seats7.isSelected == true {
            s7 = true
        }
        
        milesDaily = Int(milesDailyTextField.text!)
        milesYearly = Int(milesYearlyTextField.text!)
        howLong = Int(howLongTextField.text!)


    }
    
    
}

let master = ParentView()
let nav = UINavigationController(rootViewController: master)
PlaygroundPage.current.liveView = nav
