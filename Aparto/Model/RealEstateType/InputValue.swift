//
//  InputValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class InputValue {
    
    var placeholder: String
    var suffix: String
    var prefix: String
    var maxWidth: String
    var labelPosition: String
    
    init() {
        self.placeholder = ""
        self.suffix = ""
        self.prefix = ""
        self.maxWidth = ""
        self.labelPosition = ""
    }
    
    init(placeholder: String, suffix: String, prefix: String, maxWidth: String, labelPosition: String) {
        self.placeholder = placeholder
        self.suffix = suffix
        self.prefix = prefix
        self.maxWidth = maxWidth
        self.labelPosition = labelPosition
    }
    
    init(json: JSON) {
        self.placeholder = json["placeholder"].stringValue
        self.suffix = json["suffix"].stringValue
        self.prefix = json["prefix"].stringValue
        self.maxWidth = json["maxWidth"].stringValue
        self.labelPosition = json["labelPosition"].stringValue
    }
    
}
