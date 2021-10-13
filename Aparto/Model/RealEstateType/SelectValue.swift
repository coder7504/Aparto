//
//  SelectValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class SelectValue {
    
    var maxWidth: String
    var name: [NameRadioValue]
    
    init() {
        self.maxWidth = ""
        self.name = []
    }
    
    init(name: [NameRadioValue], maxWidth: String) {
        self.name = name
        self.maxWidth = maxWidth
    }
    
    init(json: JSON) {
        self.maxWidth = json["maxWidth"].stringValue
        self.name = json["name"].arrayValue.map{ NameRadioValue(json: $0) }
    }
    
}
