import Foundation
import SwiftyJSON

enum Reocurring: String {
    case no
    case daily
    case weekly
    case monthly
    case yearly
}

class Notification {
    var isReocurring: Reocurring
    var notes: String
    var date: Date
    
    init(isReocurring: Reocurring, notes: String, date: Date) {
        self.isReocurring = isReocurring
        self.notes = notes
        self.date = date
    }
}

extension Notification {
    convenience init?(json: JSON) {
        guard let isReocurring = json["isRecurring"].string else {
            print("Error parsing game object for key: isRecurring")
            return nil
        }
        
        guard let notes = json["notes"].string else {
            print("Error parsing game object for key: notes")
            return nil
        }
        
        guard let dateStr = json["date"].string else {
            print("Error parsing game object for key: date")
            return nil
        }
      
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        let date = dateFormatter.date(from: dateStr)!
        
        
        self.init(isReocurring: Reocurring(rawValue: isReocurring)!, notes: notes, date: Date())
    }
}
