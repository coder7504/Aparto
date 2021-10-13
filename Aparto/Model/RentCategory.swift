//
//  RentCategory.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/27/21.
//

import Foundation
import SwiftyJSON




class RentCategory {
    
    var name: Population
    var _id: String
    var isSelected: Bool
    
    init() {
        name = Population(en: "",
                          ru: "",
                          uz: "")
        _id = ""
        isSelected = false
    }
    
    init(name: Population, _id: String) {
        self.name = name
        self._id = _id
        isSelected = false
    }
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        isSelected = false
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
