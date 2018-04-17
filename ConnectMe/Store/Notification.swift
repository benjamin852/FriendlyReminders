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

// Parse JSON into a Notifcation Object
extension Notification {
    convenience init?(json: JSON, formatter: DateFormatter) {
        guard let isReocurring = json["isRecurring"].string else {
            print("Error parsing game object for key: isRecurring")
            return nil
        }
        
        guard let notes = json["notes"].string else {
            print("Error parsing game object for key: notes")
            return nil
        }
        
        // A reminder has to have a date
        guard let dateStr = json["date"].string else {
            print("Error parsing game object for key: date")
            return nil
        }
        
        // If the date cannot be translated the remidner is useless
        guard let date = formatter.date(from: dateStr) else {
            print("Date could not be formatted check the date server is returning")
            return nil
        }

        self.init(isReocurring: Reocurring(rawValue: isReocurring)!, notes: notes, date: date)
    }
}
