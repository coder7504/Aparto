//
//  Contact.swift
//  Aparto
//
//  Created by Mac user on 06/10/21.
//

import Foundation
import SwiftyJSON


class Contact {
    
    var name: String
    var phoneNumber: String
    
    init() {
        phoneNumber = ""
        name        = ""
    }
    
    init(name: String, phoneNumber: String) {
        self.name            = name
        self.phoneNumber     = phoneNumber
    }
    
    init(json: JSON) {
        self.phoneNumber = json["contact"]["phoneNumber"].stringValue
        self.name = json["contact"]["name"].stringValue
    }
    
}
