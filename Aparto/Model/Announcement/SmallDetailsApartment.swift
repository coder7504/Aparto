//
//  SmallDetailsApartment.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class SmallDetailsApartment {
    
    var from: Int
    var to: Int
    
    init() {
        from = 0
        to = 0
    }
    
    init(from: Int, to: Int) {
        self.from = from
        self.to = to
    }
    
    init(json: JSON) {
        self.from = json["from"].intValue
        self.to = json["to"].intValue
    }
    
}
