//
//  ComplainCategory.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/27/21.
//

import Foundation
import SwiftyJSON


class ComplainCategory {
    
    var _id: String
    var complainType: String
    var name: Population
    
    
    init() {
        _id          = ""
        complainType = ""
        name         = Population(en: "",
                                 ru: "",
                                 uz: "")
    }
    
    init(id: String, name: Population, complainType: String) {
        self._id            = id
        self.name           = name
        self.complainType   = complainType
    }
    
    init(json: JSON) {
        self._id            = json["_id"].stringValue
        self.complainType   = json["complainType"].stringValue
        self.name           = Population(en: json["name"]["en"].stringValue,
                                         ru: json["name"]["ru"].stringValue,
                                         uz: json["name"]["uz"].stringValue)
    }
    
    
//    methods
    
    func getID() -> String {
        _id
    }
    
    func getTitle() -> String {
        switch Cache.getAppLanguage() {
        case .en:
            return name.en
        case .ru:
            return name.ru
        case .uz:
            return name.uz
        }
    }
    
    
}
