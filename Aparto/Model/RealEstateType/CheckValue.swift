//
//  CheckValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class CheckValue {
    
    var defaultChecked: Bool

    
    init() {
        self.defaultChecked = false
    }
    
    init(defaultChecked: Bool) {
        self.defaultChecked = defaultChecked
    }
    
    init(json: JSON) {
        self.defaultChecked = json["defaultChecked"].boolValue
    }
    
}
