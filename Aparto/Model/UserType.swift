//
//  UserType.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/26/21.
//

import Foundation
import SwiftyJSON


class UserType {
    
    var _id: String
    var name: Population
    var color: UIColor
    var isSelected: Bool
    var status: String
    
    init() {
        _id         = ""
        color       = UIColor.hovered
        isSelected  = false
        status      = ""
        name        = Population(en: "",
                                 ru: "",
                                 uz: "")
    }
    
    init(id: String, name: Population, color: UIColor, isSelected: Bool, status: String) {
        self._id        = id
        self.name       = name
        self.color      = color
        self.isSelected = isSelected
        self.status     = status
    }
    
    init(json: JSON) {
        self._id = json["_id"].stringValue
        self.color = UIColor.hovered
        self.isSelected = false
        self.status = json["status"].stringValue
        self.name = Population(en: json["name"]["en"].stringValue,
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
