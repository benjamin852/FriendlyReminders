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

// Parse JSON into a Friend Object
extension Friend {
    convenience init?(json: JSON, formatter: DateFormatter) {
        guard let name = json["name"].string else {
            print("Error parsing game object for key: name")
            return nil
        }
        
        guard let notes = json["notes"].string else {
            print("Error parsing game object for key: notes")
            return nil
        }
        
        // User may not have added friends birthday
        var birthday: Date?
        if let birthdayStr = json["birthday"].string{
            if let formattedDate = formatter.date(from: birthdayStr) {
                birthday = formattedDate
            }
        }
        
        self.init(name: name, notes: notes, birthday: birthday)
    }
}
