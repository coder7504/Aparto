//
//  BadgeType.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class BadgeType {
    
    var name: Population
    var description: Population
    var _id : String
    var icons: Icons
    
    init() {
        self.name = Population(en: "", ru: "", uz: "")
        self.description = Population(en: "", ru: "", uz: "")
        self._id = ""
        self.icons = Icons(_id: "", name: "", image: "")
    }
    
    init(json: JSON) {
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        self.description = Population(en: json["description"]["en"].stringValue, ru: json["description"]["ru"].stringValue, uz: json["description"]["uz"].stringValue)
        self._id = json["_id"].stringValue
        self.icons = Icons(json: json["icons"])
    }
    
}
