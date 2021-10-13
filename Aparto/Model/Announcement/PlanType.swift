//
//  PlanType.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class PlanType {
    
    var area: SmallDetailsApartment
    var cost: SmallDetailsApartment
    var images: [String]
    var _id: String
    var name: String
    var apartmentQuantity: Int
    
    init() {
        area = SmallDetailsApartment(from: 0, to: 0)
        cost = SmallDetailsApartment(from: 0, to: 0)
        images = []
        _id = ""
        name = ""
        apartmentQuantity = 0
    }
    
    init(area: SmallDetailsApartment, cost: SmallDetailsApartment, images: [String], _id: String, name: String, apartmentQuantity: Int) {
        self.area = area
        self.cost = cost
        self.images = images
        self._id = _id
        self.name = name
        self.apartmentQuantity = apartmentQuantity
    }
    
    init(json: JSON) {
        self.area = SmallDetailsApartment(json: json["area"])
        self.cost = SmallDetailsApartment(json: json["cost"])
        self.images = json["images"].arrayValue.map{ $0.stringValue }
        self._id = json["_id"].stringValue
        self.name = json["name"].stringValue
        self.apartmentQuantity = json["apartmentQuantity"].intValue
    }
    
    
}
