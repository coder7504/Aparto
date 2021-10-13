//
//  PaymentType.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class PaymentType {
    
    var name: Population
    var badgeName: Population
    var _id: String
    var price: Int
    var region: Region
    var conditions: [NameRadioValue]
    var icons: Icons
    var paymentUserType: String
    var totalDuration: Int
    var topDuration: Int
    var recommendDuration: Int
    
    
    init() {
        name = Population(en: "", ru: "", uz: "")
        badgeName = Population(en: "", ru: "", uz: "")
        region = Region(name: Population(en: "", ru: "", uz: ""), _id: "")
        price = 0
        conditions = []
        icons = Icons(_id: "", name: "", image: "")
        paymentUserType = ""
        totalDuration = 0
        topDuration = 0
        recommendDuration = 0
        _id = ""
    }
    
    init(json: JSON) {
        
        _id = json["_id"].stringValue
        
        region = Region(json: json["region"])
        
        name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        
        badgeName = Population(en: json["badgeName"]["en"].stringValue, ru: json["badgeName"]["ru"].stringValue, uz: json["badgeName"]["uz"].stringValue)
        
        price = json["price"].intValue
        
        totalDuration = json["totalDuration"].intValue
        
        topDuration = json["topDuration"].intValue
        
        recommendDuration = json["recommendDuration"].intValue
        
        conditions = json["conditions"].arrayValue.map{ NameRadioValue(json: $0) }
        
        icons = Icons(json: json["icons"])
        
        paymentUserType = json["paymentUserType"].stringValue
        
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
