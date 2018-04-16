import Foundation
import SwiftyJSON

class Friend {
    var name: String
    var notes: String
    var birthday: Date?
    
    init(name: String, notes: String, birthday: Date?) {
        self.name = name
        self.notes = notes
        self.birthday = birthday
    }
}

extension Friend {
    convenience init?(json: JSON) {
        guard let name = json["name"].string else {
            print("Error parsing game object for key: name")
            return nil
        }
        
        guard let notes = json["notes"].string else {
            print("Error parsing game object for key: notes")
            return nil
        }
        
        var birthday: Date?
        if let birthdayStr = json["birthday"].string{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            birthday = dateFormatter.date(from: birthdayStr)!
        }
        
        self.init(name: name, notes: notes, birthday: birthday)
    }
}
