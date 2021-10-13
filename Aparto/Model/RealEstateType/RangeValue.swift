//
//  RangeValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class RangeValue {
    
    var firstPlaceholder: String
    var secondPlaceholder: String
    var firstText: String
    var secondText: String
    
    
    init() {
        self.firstPlaceholder = ""
        self.secondPlaceholder = ""
        self.firstText = ""
        self.secondText = ""
    }
    
    init(firstPlaceholder: String, secondPlaceholder: String, firstText: String, secondText: String) {
        self.firstPlaceholder = firstPlaceholder
        self.secondPlaceholder = secondPlaceholder
        self.firstText = firstText
        self.secondText = secondText
    }
    
    init(json: JSON) {
        self.firstPlaceholder = json["firstPlaceholder"].stringValue
        self.secondPlaceholder = json["secondPlaceholder"].stringValue
        self.firstText = json["firstText"].stringValue
        self.secondText = json["secondText"].stringValue
    }
    
}
