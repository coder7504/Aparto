//
//  UploadValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class UploadValue {
    
    var text: Population
    var format: [String]
    var multiple: Bool

    
    init() {
        self.text = Population(en: "", ru: "", uz: "")
        self.format = []
        self.multiple = false
    }
    
    init(text: Population, format: [String], multiple: Bool) {
        self.text = text
        self.format = format
        self.multiple = multiple
    }
    
    init(json: JSON) {
        self.text = Population(en: json["text"]["en"].stringValue, ru: json["text"]["ru"].stringValue, uz: json["text"]["uz"].stringValue)
        self.format = json["format"].arrayValue.map{ $0.stringValue }
        self.multiple = json["multiple"].boolValue
    }
    
}
