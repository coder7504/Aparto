//
//  PublicUser.swift
//  Aparto
//
//  Created by Mac user on 12/10/21.
//

import Foundation
import SwiftyJSON

class PublicUser {
    
    var phoneNumber: String
    var _id: String
    var firstName: String
    var lastName: String
    var email: String
    var announcement: [Announcement]
    
    init() {
        phoneNumber = ""
        _id = ""
        firstName = ""
        lastName = ""
        email = ""
        announcement = []
    }
    
    init(json: JSON) {
        self.firstName = json["firstName"].stringValue
        self.lastName = json["lastName"].stringValue
        self._id = json["_id"].stringValue
        self.phoneNumber = json["phoneNumber"].stringValue
        self.email = json["email"].stringValue
        self.announcement = json["announcements"].arrayValue.map{ Announcement(json: $0) }
    }
    
}
