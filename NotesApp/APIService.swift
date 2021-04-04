import Foundation
import Alamofire

// MARK:- The Model

struct Note: Decodable {
    var _id: String
    var title: String
    var date: Date
    var note: String
}

// MARK:- The API

class APIServices {
    
    // MARK:- Instances
    
    var delegate: DataDelegate?
    static let services = APIServices()
    
    // MARK:- Functions
    
    func fetchNotes() {
        AF.request("http://localhost:3000/notes/").response { response in
            print(response.data)
            //
            let data = String(data: response.data!, encoding: .utf8)
        }
    }
}
