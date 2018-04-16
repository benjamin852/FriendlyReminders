import Foundation
import SwiftyJSON

class User {
    var name: String
    var userName: String
    var birthday: Date?
    var profileImage: UIImage?

    init(name: String, userName: String, birthday: Date?, profileImage: UIImage?) {
        self.name = name
        self.userName = userName
        self.birthday = birthday
        self.profileImage = profileImage
    }
}

extension User {
    convenience init?(json: JSON) {
        guard let name = json["name"].string else {
            print("Error parsing game object for key: name")
            return nil
        }
        
        guard let userName = json["userName"].string else {
            print("Error parsing game object for key: userName")
            return nil
        }
        
        var birthday: Date?
        if let birthdayStr = json["birthday"].string{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            birthday = dateFormatter.date(from: birthdayStr)!
        }
        
        var profileImage: UIImage?
        if let profileImageStr = json["profileImageURL"].string {
            print(profileImageStr)
        }
        
        self.init(name: name, userName: userName, birthday: birthday, profileImage: profileImage)
    }
}
