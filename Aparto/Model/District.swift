//
//  District.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class District {
    
    var name: Population
    var _id: String
    var region: Region
    
    init() {
        name = Population(en: "",
                          ru: "",
                          uz: "")
        _id = ""
        region = Region(name: Population(en: "", ru: "", uz: ""), _id: "")
    }
    
    init(name: Population, _id: String, region: Region) {
        self.name = name
        self._id = _id
        self.region = region
    }
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        region = Region(json: json["region"])
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
