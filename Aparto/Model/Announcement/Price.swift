//
//  Price.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class Price {
    
    var amount: Int
    var currency: Currency
    
    init() {
        self.amount = 0
        self.currency = Currency()
    }
    
    init(amount: Int, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    init(json: JSON) {
        self.amount = json["amount"].intValue
        self.currency = Currency(json: json["currency"])
    }
    
}

