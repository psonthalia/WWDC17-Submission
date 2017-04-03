import PlaygroundSupport
import UIKit

class WWDCMasterViewController: UITableViewController {
    override func viewDidLoad() {
        title = "Reasons I should attend WWDC"
    }
    var reasons = ["the labs are great", "the sessions teach new things", "the people are awesome", "the keynote rocks", "I must hug Joe Groff"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // attempt to dequeue a cell
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            // none to dequeue – make a new one
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell?.accessoryType = .disclosureIndicator
        }
        let reason = reasons[indexPath.row]
        cell.detailTextLabel?.text = "I want to attend because \(reason)"
        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
        
        // configure cell here
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else { return }
        
        let detail = WWDCDetailViewController()
        detail.message = text
        navigationController?.pushViewController(detail, animated: true)
    }
    
}


class WWDCDetailViewController: UIViewController {
    var message = ""
    
    override func loadView() {
        title = "Please let me go!"
        view = UIView()
        view.backgroundColor = UIColor.white
    }
    
    var animator: UIDynamicAnimator?
    
    override func viewDidLayoutSubviews() {
        guard animator == nil else { return }
        
        // 1: split the message up into words
        let words = message.components(separatedBy: " ")
        
        // 2: create an empty array of labels
        var labels = [UILabel]()
        
        // 3: convert each word into a label
        for (index, word) in words.enumerated() {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            // 4: position the labels one above the other
            label.center = CGPoint(x: view.frame.midX, y: 50 + CGFloat(30 * index))
            label.text = word
            label.sizeToFit()
            view.addSubview(label)
            
            labels.append(label)
        }
        
        // 5: create a gravity behaviour for our labels
        let gravity = UIGravityBehavior(items: labels)
        animator = UIDynamicAnimator(referenceView: view)
        animator?.addBehavior(gravity)
        
        // 6: create a collision behavior for our labels
        let collisions = UICollisionBehavior(items: labels)
        
        // 7: give some boundaries for the collisions
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisions)
    }
}

let master = WWDCMasterViewController()
let nav = UINavigationController(rootViewController: master)
PlaygroundPage.current.liveView = nav
