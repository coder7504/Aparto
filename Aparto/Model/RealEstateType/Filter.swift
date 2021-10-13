//
//  AboutBuilding.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class Filter {
    
    var name: Population
    var inputValues: InputValue
    var radioValues: RadioValue
    var selectValues: SelectValue
    var rangeValues: RangeValue
    var uploadValues: UploadValue
    var checkboxValues: CheckValue
    var switchValues: CheckValue
    var keyValues: [NameRadioValue]
    var labelPosition: String
    var isRequired: Bool
    var isRoomNumber: Bool
    var isArea: Bool
    var _id: String
    var inputType: String
    var status: Int
    
    init() {
        self.name = Population(en: "", ru: "", uz: "")
        self.inputValues = InputValue(placeholder: "", suffix: "", prefix: "", maxWidth: "", labelPosition: "")
        self.radioValues = RadioValue(name: [NameRadioValue(title: Population(en: "", ru: "", uz: ""), _id: "")])
        self.selectValues = SelectValue(name: [NameRadioValue(title: Population(en: "", ru: "", uz: ""), _id: "")], maxWidth: "")
        self.rangeValues = RangeValue(firstPlaceholder: "", secondPlaceholder: "", firstText: "", secondText: "")
        self.uploadValues = UploadValue(text: Population(en: "", ru: "", uz: ""), format: [], multiple: false)
        self.checkboxValues = CheckValue(defaultChecked: false)
        self.switchValues = CheckValue(defaultChecked: false)
        keyValues = []
        self.labelPosition = ""
        self.isRequired = false
        self.isRoomNumber = false
        self.isArea = false
        self._id = ""
        self.inputType = ""
        self.status = 0
    }
    
    init(name: Population, inputValues: InputValue, radioValues: RadioValue, selectValues: SelectValue, rangeValues: RangeValue, uploadValues: UploadValue, checkboxValues: CheckValue, switchValues: CheckValue, labelPosition: String, isRequired: Bool, isRoomNumber: Bool, isArea: Bool, _id: String, inputType: String, status: Int, keyValues: [NameRadioValue]) {
        
        self.name = name
        self.inputValues = inputValues
        self.radioValues = radioValues
        self.selectValues = selectValues
        self.rangeValues = rangeValues
        self.uploadValues = uploadValues
        self.checkboxValues = checkboxValues
        self.switchValues = switchValues
        self.labelPosition = labelPosition
        self.isRequired = isRequired
        self.isRoomNumber = isRoomNumber
        self.isArea = isArea
        self._id = _id
        self.inputType = inputType
        self.status = status
        self.keyValues = keyValues
        
    }
    
    init(json: JSON) {
        
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        
        self.inputValues = InputValue(json: json["inputValues"])
        
        self.radioValues = RadioValue(json: json["radioValues"])
        
        self.selectValues = SelectValue(json: json["selectValues"])
        
        self.rangeValues = RangeValue(json: json["rangeValues"])
        
        self.uploadValues = UploadValue(json: json["uploadValues"])
        
        self.checkboxValues = CheckValue(json: json["checkboxValues"])
        
        self.switchValues = CheckValue(json: json["switchValues"])
        
        self.labelPosition = json["labelPosition"].stringValue
        
        self.isRequired = json["isRequired"].boolValue
        
        self.isRoomNumber = json["isRoomNumber"].boolValue
        
        self.isArea = json["isArea"].boolValue
        
        self._id = json["_id"].stringValue
        
        self.inputType = json["inputType"].stringValue
        
        self.status = json["status"].intValue
        
        self.keyValues = json["keyValues"].arrayValue.map{ NameRadioValue(json: $0) }
        
    }
    
    
}
