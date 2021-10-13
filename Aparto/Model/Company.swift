//
//  Company.swift
//  Aparto
//
//  Created by Mac user on 12/10/21.
//

import Foundation
import SwiftyJSON

class Company {
    
    var phoneNumber: String
    var _id: String
    var firstName: String
    var lastName: String
    var officeDescription: String
    var image: String
    var announcements: Int
    
    init() {
        phoneNumber = ""
        _id = ""
        firstName = ""
        lastName = ""
        officeDescription = ""
        image = ""
        announcements = 0
    }
    
    init(json: JSON) {
        self.firstName = json["firstName"].stringValue
        self.lastName = json["lastName"].stringValue
        self._id = json["_id"].stringValue
        self.phoneNumber = json["phoneNumber"].stringValue
        self.officeDescription = json["officeDescription"].stringValue
        self.image = json["image"].stringValue
        self.announcements = json["announcements"].intValue
    }
    
}
