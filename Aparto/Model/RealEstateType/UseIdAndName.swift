//
//  UseIdAndName.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class NameRadioValue {
    
    var title: Population
    var _id: String
    
    init() {
        self.title = Population(en: "", ru: "", uz: "")
        self._id = ""
    }
    
    init(title: Population, _id: String) {
        self.title = title
        self._id = _id
    }
    
    init(json: JSON) {
        self.title = Population(en: json["en"].stringValue, ru: json["ru"].stringValue, uz: json["uz"].stringValue)
        self._id = json["_id"].stringValue
    }
    
}

