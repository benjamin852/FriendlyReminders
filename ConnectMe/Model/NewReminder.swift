//
//  NewReminder.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-02-17.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

enum ModelFieldType: String {
    case nameCell
    case time
    case timeZone
    case repeatCell
}

class NewReminder : NSObject {
    
    var name: UITextField!
    var time: Date!
    var timeZone : String!
    var repeatCell : Bool!
    
    
    //we call the model object in the hard coded instantiation of the AddNewReminderVC
//    init(name: String!, time: Date!, timeZone : String!, repeatParam : Bool!) {
//        self.name = name
//        self.time = time
//        self.timeZone = timeZone
//        self.repeatCell = repeatParam
//    }
    
    //each enum case returns the value of its corresponding global var
    func valueForField(field: ModelFieldType) -> Any {
        switch field {
        case .nameCell : return name
        case .time : return time
        case .timeZone : return timeZone
        case .repeatCell : return repeatCell
        }
    }
    
    
    func stringValueForField(field: ModelFieldType) -> String {
        if field == .time {
            guard let date = time else { return "-" }
            return NewReminder.dateStringFromDate(date: date)
        }
        else {
            return valueForField(field: field) as? String ?? "-"
        }
    }
    
    func setValue(value: Any, forField field: ModelFieldType) {
        switch field {
        
        case .nameCell:
            if let name = value as? UITextField {
                self.name = name
            }
       
        case .time:
            if let time = value as? Date {
                self.time = time
            }
            else if let swString = value as? String, let swFromString = NewReminder.dateFromString(dateString: swString) {
                self.time = swFromString
            }
       
        case .timeZone :
            if let timeZone = value as? String {
                self.timeZone = timeZone
            }
      
        case .repeatCell:
            if let repeatCell = value as? Bool {
                self.repeatCell = repeatCell}
        }
    }
    
    
//    override func isEqual(_ object: Any?) -> Bool {
//        guard let otherPerson = object as? NewReminder else { return false }
//        return otherPerson == self
//    }
    
    static var _dateFormatter: DateFormatter?
    fileprivate static var dateFormatter: DateFormatter {
        if (_dateFormatter == nil) {
            _dateFormatter = DateFormatter()
            _dateFormatter!.locale = Locale(identifier: "en_US_POSIX")
            _dateFormatter!.dateFormat = "MM/dd/yyyy"
        }
        return _dateFormatter!
    }
    static func dateFromString(dateString: String) -> Date? {  ///CHECKMARK
        return dateFormatter.date(from: dateString)
    }
    static func dateStringFromDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    override var description: String {
        return "Person. Name: \(name) Time Zone : \(timeZone), Repeat  \(repeatCell)"
    }
}
