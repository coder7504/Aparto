//
//  RadioValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class RadioValue {
    
    var name: [NameRadioValue]
    
    init() {
        self.name = []
    }
    
    init(name: [NameRadioValue]) {
        self.name = name
    }
    
    init(json: JSON) {
        self.name = json["name"].arrayValue.map{ NameRadioValue(json: $0) }
    }
    
}

