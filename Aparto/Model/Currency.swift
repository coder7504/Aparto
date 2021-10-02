//
//  Currency.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/28/21.
//

import Foundation
import SwiftyJSON


class Currency {
    
    var _id: String
    var currencyRate: Int
    var name: String
    
    
    init() {
        _id          = ""
        currencyRate = 0
        name         = ""
    }
    
    init(id: String, name: String, currencyRate: Int) {
        self._id            = id
        self.name           = name
        self.currencyRate   = currencyRate
    }
    
    init(json: JSON) {
        self._id            = json["_id"].stringValue
        self.currencyRate   = json["currencyRate"].intValue
        self.name           = json["name"].stringValue
    }
    
    
//    methods
    
    func getID() -> String {
        _id
    }

    
}
