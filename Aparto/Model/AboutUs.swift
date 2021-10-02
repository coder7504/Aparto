//
//  AboutUs.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/29/21.
//

import Foundation
import SwiftyJSON

class AboutUs {
    
    var address: String
    var workTime: String
    var about: Population
    var coordinates: [Double]
    var _id: String
    var phoneNumber: String
    var telegramBot: String
    var email: String
    var officePhoneNumber: String
    
    init() {
        address = ""
        workTime = ""
        about = Population(en: "", ru: "", uz: "")
        coordinates = []
        _id = ""
        phoneNumber = ""
        telegramBot = ""
        email = ""
        officePhoneNumber = ""
    }
    
    init(address: String, workTime: String, about: Population, coordinates: [Double], _id: String, phoneNumber: String, telegramBot: String, email: String, officePhoneNumber: String) {
        self.address = address
        self.workTime = workTime
        self.about = about
        self.coordinates = coordinates
        self._id = _id
        self.phoneNumber = phoneNumber
        self.telegramBot = telegramBot
        self.email = email
        self.officePhoneNumber = officePhoneNumber
    }
    
    init(json: JSON) {
        self.address = json["address"].stringValue
        self.workTime = json["workTime"].stringValue
        self.about = Population(en: json["about"]["en"].stringValue, ru: json["about"]["ru"].stringValue, uz: json["about"]["uz"].stringValue)
        self.coordinates = json["coordinates"].arrayValue.map{ $0.doubleValue }
        self._id = json["_id"].stringValue
        self.phoneNumber = json["phoneNumber"].stringValue
        self.telegramBot = json["telegramBot"].stringValue
        self.email = json["email"].stringValue
        self.officePhoneNumber = json["officePhoneNumber"].stringValue
        
    }
    
}


