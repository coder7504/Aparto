//
//  HelpFromUs.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/30/21.
//

import Foundation
import SwiftyJSON

class HelpFromUs {
  
    var name: Population
    var description: Population
    var faqCategory: [String]
    var _id: String
    var isCollaps: Bool
    
    init() {
        name = Population(en: "", ru: "", uz: "")
        description = Population(en: "", ru: "", uz: "")
        faqCategory = []
        _id = ""
        isCollaps = false
    }
    
    init(name: Population,description: Population, _id: String,isCollaps: Bool,faqCategory: [String]) {
        self.name = name
        self.description = description
        self.faqCategory = faqCategory
        self._id = _id
        self.isCollaps = isCollaps
    }
    
    init(json: JSON) {
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        self.description = Population(en: json["description"]["en"].stringValue, ru: json["description"]["ru"].stringValue, uz: json["description"]["uz"].stringValue)
        self.faqCategory = json["faqCategory"].arrayValue.map{ $0.stringValue }
        self._id = json["_id"].stringValue
        self.isCollaps = false
    }
    
}


