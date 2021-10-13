//
//  RealEstateType.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON

class RealEstateType {
    
    var name: Population
    var disabledRentTypes: [ObjectPermissionType]
    var objectPermissionType: [ObjectPermissionType]
    var comfortType: [ComfortType]
    var aboutBuilding: [Filter]
    var priceAndDeal: [Filter]
    var address: [Filter]
    var aboutObject: [Filter]
    var _id: String
    
    init() {
        self.name = Population(en: "", ru: "", uz: "")
        self.disabledRentTypes = []
        self.objectPermissionType = []
        self.comfortType = []
        self.aboutBuilding = []
        self.priceAndDeal = []
        self.address = []
        self._id = ""
        self.aboutObject = []
    }
    
//    init(name: Population, disabledRentTypes: [ObjectPermissionType], objectPermissionType: [ObjectPermissionType], comfortType: [ComfortType], aboutBuilding: [AboutBuilding], priceAndDeal: [AboutBuilding], address: [AboutBuilding], _id: String ) {
//
//        self.name = name
//
//    }
    
    init(json: JSON) {
        
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        
        self.disabledRentTypes = json["disabledRentTypes"].arrayValue.map{ ObjectPermissionType(json: $0) }
        
        self.objectPermissionType = json["objectPermissionType"].arrayValue.map{ ObjectPermissionType(json: $0) }
        
        self.comfortType = json["comfortType"].arrayValue.map{ ComfortType(json: $0) }
        
        self.aboutBuilding = json["aboutBuilding"].arrayValue.map{ Filter(json: $0) }
        
        self.priceAndDeal = json["priceAndDeal"].arrayValue.map{ Filter(json: $0) }
        
        self.address = json["address"].arrayValue.map{ Filter(json: $0) }
        
        self._id = json["_id"].stringValue
        
        self.aboutObject = json["aboutObject"].arrayValue.map{ Filter(json: $0) }
        
    }
    
}
