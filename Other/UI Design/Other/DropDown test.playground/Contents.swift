import UIKit
import PlaygroundSupport

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var items = ["", "Best Value", "Price Low to High", "Price High to Low"]

    override func viewDidLoad() {
        self.view.frame = CGRect(x: 150, y: 50, width: 160, height: 150)
        self.tableView = UITableView(frame:self.view.frame)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView!.allowsSelection = true
        self.view.addSubview(self.tableView)
        self.view.backgroundColor = .white
        self.tableView.alwaysBounceVertical = false
        
        let image = UIImage(named: "arrow.png")
        let imageView = UIImageView(frame: CGRect(x: 250, y: 30, width: 30, height: 30))
        imageView.image = image
        self.view.addSubview(imageView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
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
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.isSelected {
                print("This cell is selected")
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0) {
            return 30
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("working")
        print(items[indexPath.row])
    }
    
    
}

let master = ViewController()
PlaygroundPage.current.liveView = master
