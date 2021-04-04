import UIKit

protocol DataDelegate {
    func updateArray(newArray: String)
}

class ViewController: UIViewController {
    
    var notesArray = [Note]()
        
    // MARK:- IBOutlets
    @IBOutlet weak var notesTableView: UITableView!
    
    // MARK:- LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        APIServices.services.delegate = self
        APIServices.services.fetchNotes()
        print(notesArray)
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
//        cell.textLabel?.text = notesArray[indexPath.row]
        return cell
    }
}

extension ViewController: DataDelegate {
    func updateArray(newArray: String) {
        do {
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
        } catch {
            print("Failed to decode!")
        }
    }
}
