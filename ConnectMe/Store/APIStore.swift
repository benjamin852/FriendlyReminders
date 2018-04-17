import Foundation
import SwiftyJSON

struct APIStore {
    var user: User!
    var friends: [Friend] = []
    var notifications: [Notification] = []
    
    init() {
        initData()
    }

    mutating func initData() {
        guard let friendsURL = Bundle.main.url(forResource: "friendsFakeData", withExtension: "json") else {
            fatalError("Cannot find notficationsFakeData")
        }

        guard let notificationsURL = Bundle.main.url(forResource: "notficationsFakeData", withExtension: "json") else {
            fatalError("Cannot find friendsFakeData")
        }
        
        do {
            let friendsData = try Data(contentsOf: friendsURL)
            let notificationsData = try Data(contentsOf: notificationsURL)

            let jsonFriendsData = JSON(friendsData)
            let jsonNotificationsData = JSON(notificationsData)

            guard let friendsArray = jsonFriendsData["friends"].array else {
                fatalError("Cannot parse friends array")
            }
            
            guard let notificationsArray = jsonNotificationsData["notifications"].array else {
                fatalError("Cannot parse notifications array")
            }
            
            for json in friendsArray {
                if let friend = Friend(json: json) {
                    friends.append(friend)
                }
            }
            
            for json in notificationsArray {
                if let notification = Notification(json: json) {
                    notifications.append(notification)
                }
            }
            
            print(friends.count)
            print(notifications.count)
            
        } catch {
            print(error)
        }
    }
}
