//
//  NewsCategory.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/30/21.
//

import Foundation
import SwiftyJSON

class NewsCategory {
    
    var name: Population
    var _id: String
    
    init() {
        name = Population(en: "",
                          ru: "",
                          uz: "")
        _id = ""
    }
    
    init(name: Population, _id: String) {
        self.name = name
        self._id = _id
    }
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
    }

}
