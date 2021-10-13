//
//  PaymentHistory.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class PaymentHistory {
    
    var createdAt: String
    var _id: String
    var paymentType: String
    
    
    init() {
       createdAt = ""
        paymentType = ""
        _id = ""
    }
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        createdAt = json["createdAt"].stringValue
        paymentType = json["paymentType"].stringValue
    }
    
    
}
