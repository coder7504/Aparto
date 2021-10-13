//
//  Region.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class Region {
    
    var name: Population
    var _id: String
    var isCapital: Bool
    
    init() {
        name = Population(en: "",
                          ru: "",
                          uz: "")
        _id = ""
        isCapital = false
    }
    
    init(name: Population, _id: String) {
        self.name = name
        self._id = _id
        isCapital = false
    }
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        isCapital = json["isCapital"].boolValue
        name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
    }
    
    
//    methods
    
    func getId() -> String {
        _id
    }
    
    func getTitile() -> String {
        switch Cache.getAppLanguage() {
        case .uz:
           return name.uz
        case .ru:
           return name.ru
        case .en:
           return name.en
        }
    }
    
}
