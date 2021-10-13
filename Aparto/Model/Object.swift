//
//  Object.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON


class Object {
    
    var name: Population
    var sellType: [SellType]
    var rentType: [RentCategory]
    var realEstateType: [RealEstateType]
    var objectPermissionType: [ObjectPermissionType]
    var comfortType: [ComfortType]
    var aboutObject: [Filter]
    var aboutBuilding: [Filter]
    var priceAndDeal: [Filter]
    var address: [Filter]
    var filters: [Filter]
    var _id: String
    var isNumberOfRoomsAsked: Int
    var isNumberOfFloorsAsked: Int
    var isTotalAreaAsked: Int
    var isLivingAreaAsked: Int
    var isKitchenAreaAsked: Int
    var isBuildingNameAsked: Int
    var isBuildYearAsked: Int
    var isHeightOfCeilingAsked: Int
    var isPricePerMonth: Int
    var isBargainAllowed: Int
    var isExchangeAllowed: Int

    init() {
        self.name = Population(en: "", ru: "", uz: "")
        self.sellType = []
        self.rentType = []
        self.realEstateType = []
        self.objectPermissionType = []
        self.comfortType = []
        self.aboutObject = []
        self.aboutBuilding = []
        self.priceAndDeal = []
        self.address = []
        self.filters = []
        self._id = ""
        self.isNumberOfRoomsAsked = 0
        self.isNumberOfFloorsAsked = 0
        self.isTotalAreaAsked = 0
        self.isLivingAreaAsked = 0
        self.isKitchenAreaAsked = 0
        self.isBuildingNameAsked = 0
        self.isBuildYearAsked = 0
        self.isHeightOfCeilingAsked = 0
        self.isPricePerMonth = 0
        self.isBargainAllowed = 0
        self.isExchangeAllowed = 0
    }
    
    init(json: JSON) {
        
        self.name = Population(en: json["name"]["en"].stringValue, ru: json["name"]["ru"].stringValue, uz: json["name"]["uz"].stringValue)
        
        self.sellType = json["sellType"].arrayValue.map{ SellType(json: $0) }
        
        self.rentType = json["rentType"].arrayValue.map{ RentCategory(json: $0) }
        
        self.realEstateType = json["realEstateType"].arrayValue.map{ RealEstateType(json: $0) }
        
        self.objectPermissionType = json["objectPermissionType"].arrayValue.map{ ObjectPermissionType(json: $0) }
        
        self.comfortType = json["comfortType"].arrayValue.map{ ComfortType(json: $0) }
        
        self.aboutObject = json["aboutObject"].arrayValue.map{ Filter(json: $0) }
        
        self.aboutBuilding = json["aboutBuilding"].arrayValue.map{ Filter(json: $0) }
        
        self.priceAndDeal = json["priceAndDeal"].arrayValue.map{ Filter(json: $0) }
        
        self.address = json["address"].arrayValue.map{ Filter(json: $0) }
        
        self.filters = json["filters"].arrayValue.map{ Filter(json: $0) }
        
        self._id =  json["_id"].stringValue
       
        self.isNumberOfRoomsAsked = json["isNumberOfRoomsAsked"].intValue
        
        self.isNumberOfFloorsAsked = json["isNumberOfFloorsAsked"].intValue
        
        self.isTotalAreaAsked = json["isTotalAreaAsked"].intValue
        
        self.isLivingAreaAsked = json["isLivingAreaAsked"].intValue
        
        self.isKitchenAreaAsked = json["isKitchenAreaAsked"].intValue
        
        self.isBuildingNameAsked = json["isBuildingNameAsked"].intValue
        
        self.isBuildYearAsked = json["isBuildYearAsked"].intValue
        
        self.isHeightOfCeilingAsked = json["isHeightOfCeilingAsked"].intValue
        
        self.isPricePerMonth = json["isPricePerMonth"].intValue
        
        self.isBargainAllowed = json["isBargainAllowed"].intValue
        
        self.isExchangeAllowed = json["isExchangeAllowed"].intValue
        
    }
    
    
    
}
