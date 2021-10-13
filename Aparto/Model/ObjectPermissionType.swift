//
//  ObjectPermissionType.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class ObjectPermissionType {
    
    var name: Population
    var priorityLevel: String
    var _id : String
    var icons: Icons
    
    init() {
        self.name = Population(en: "", ru: "", uz: "")
        self.priorityLevel = ""
        self._id = ""
        self.icons = Icons(_id: "", name: "", image: "")
    }
    
    init(json: JSON) {
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        self.priorityLevel = json["priorityLevel"].stringValue
        self._id = json["_id"].stringValue
        self.icons = Icons(json: json["icons"])
    }
    
}

