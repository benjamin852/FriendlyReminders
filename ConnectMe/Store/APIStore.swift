import Foundation
import SwiftyJSON

struct APIStore {
    var user: User!
    var friends: [Friend] = []
    var notifications: [Notification] = []

}
