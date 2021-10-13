//
//  NewBuildingValue.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class NewBuildingValue {
    
    var badgeType: [String]
    var buildingPermission: [String]
    var planTypes: [PlanType]
    var buildYear: Int
    
    init() {
        self.badgeType = []
        self.buildingPermission = []
        self.planTypes = []
        self.buildYear = 0
    }
    
    init(badgeType: [String], buildingPermission: [String], planTypes: [PlanType], buildYear: Int) {
        self.badgeType = badgeType
        self.buildingPermission = buildingPermission
        self.planTypes = planTypes
        self.buildYear = buildYear
    }
    
    init(json: JSON) {
        self.badgeType = json["badgeType"].arrayValue.map{ $0.stringValue }
        self.buildingPermission = json["buildingPermission"].arrayValue.map{ $0.stringValue }
        self.planTypes = json["planTypes"].arrayValue.map{ PlanType(json: $0) }
        self.buildYear = json["buildYear"].intValue
    }
    
    
}
