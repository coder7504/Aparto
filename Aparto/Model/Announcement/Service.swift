//
//  Service.swift
//  Aparto
//
//  Created by Mac user on 12/10/21.
//

import Foundation
import SwiftyJSON

class Service {
    
    var title: String
    var _id: String
    var link: String
    var price: Double
    var serviceType: String
    var image: String
    
    init() {
        title = ""
        _id = ""
        link = ""
        price = 0
        serviceType = ""
        image = ""
    }
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.link = json["link"].stringValue
        self._id = json["_id"].stringValue
        self.serviceType = json["serviceType"].stringValue
        self.image = json["image"].stringValue
        self.price = json["price"].doubleValue
    }
    
}
