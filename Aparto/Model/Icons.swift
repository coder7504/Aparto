//
//  Icons.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class Icons {
    
    var _id: String
    var name: String
    var image: String
    
    init() {
        self._id = ""
        self.name = ""
        self.image = ""
    }
    
    init(_id: String, name: String, image: String) {
        self._id = _id
        self.name = name
        self.image = image
    }
    
    init(json: JSON) {
        self._id = json["_id"].stringValue
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
    }
    
}
