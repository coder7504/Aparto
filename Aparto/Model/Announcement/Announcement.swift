//
//  Announcement.swift
//  Aparto
//
//  Created by Mac user on 07/10/21.
//

import Foundation
import SwiftyJSON
import YandexMapsMobile
import MapKit

class Announcement {
    
    var contact: Contact
    var newBuildingValues: NewBuildingValue
    var price: Price
    var coordinates: [Double]
    var badgeType: [BadgeType]
    var objectPermissionType: [ObjectPermissionType]
    var comfortType: [ComfortType]
    var additionalComfortType: [ComfortType]
    var images: [String]
    var isNewBuilding: Bool
    var seen: [String]
    var called: Int
    var liked: Int
    var chatted: Int
    var status: String
    var isSellWithAparto: Bool
    var _id: String
    var userType: UserType
    var sellType: SellType
    var realEstateType: RealEstateType
    var object: Object
    var region: Region
    var district: District
    var title: String
    var filter: [Filter]
    var description: String
    var autoPayment: Bool
    var paymentHistory: PaymentHistory
    var readyToExchange: Bool
    var user: String
    var totalEndDate: String
    var topEndDate: String
    var recommendEndDate: String
    var createdAt: String
    var updatedAt: String
    var maxPrice: Double
    var minPrice: Double
    var isTapped: Bool
    
    init() {
        
        self.contact = Contact(name: "", phoneNumber: "")
        
        self.newBuildingValues = NewBuildingValue(badgeType: [], buildingPermission: [], planTypes: [], buildYear: 0)
        
        self.price = Price(amount: 0, currency: Currency())
        
        self.coordinates = []
        
        self.badgeType = []
        
        self.objectPermissionType = []
        
        self.comfortType = []
        
        
        self.additionalComfortType = []
        
        self.images = []
        
        self.isNewBuilding = false
        
        self.seen = []
        
        self.called = 0
        
        self.liked = 0
        
        self.chatted = 0
        
        self.status = ""
        
        self.isSellWithAparto = false
        
        self._id = ""
        
        self.userType = UserType(id: "", name: Population(en: "", ru: "", uz: ""), color: .black, isSelected: false, status: "")
        
        self.sellType = SellType(id: "", name: Population(en: "", ru: "", uz: ""), color: .black, isSelected: false, status: "")
        
        self.realEstateType = RealEstateType()
        
        self.object = Object()
        
        self.region = Region(name: Population(en: "", ru: "", uz: ""), _id: "")
        
        self.district = District(name: Population(en: "", ru: "", uz: ""), _id: "", region: Region(name: Population(en: "", ru: "", uz: ""), _id: ""))
        
        self.title = ""
        
        self.filter = []
        
        self.description = ""
        
        self.autoPayment = false
        
        self.paymentHistory = PaymentHistory()
        
        self.readyToExchange = false
        
        self.user = ""
        
        self.totalEndDate = ""
        
        self.topEndDate = ""
        
        self.recommendEndDate = ""
        
        self.createdAt = ""
        
        self.updatedAt = ""
        
        self.maxPrice = 0
        
        self.minPrice = 0
        
        self.isTapped = false
        
    }
    
    init(json: JSON) {
        
        self.contact = Contact(json: json["contact"])
       
        self.newBuildingValues = NewBuildingValue(json: json["newBuildingValues"])
        
        self.price = Price(json: json["price"])
        
        self.coordinates = json["coordinates"].arrayValue.map{ $0.doubleValue }
        
        self.badgeType = json["badgeType"].arrayValue.map{ BadgeType(json: $0) }
        
        self.objectPermissionType = json["objectPermissionType"].arrayValue.map{ ObjectPermissionType(json: $0) }
        
        self.comfortType = json["comfortType"].arrayValue.map{ ComfortType(json: $0) }
        
        self.additionalComfortType = json["additionalComfortType"].arrayValue.map{ ComfortType(json: $0) }
        self.images = json["images"].arrayValue.map{ $0.stringValue }
        
        self.isNewBuilding = json["isNewBuilding"].boolValue
        
        self.seen = json["seen"].arrayValue.map{ $0.stringValue }
        
        self.called = json["called"].intValue
        
        self.liked =  json["liked"].intValue
        
        self.chatted =  json["chatted"].intValue
        
        self.status = json["status"].stringValue
        
        self.isSellWithAparto = json["isSellWithAparto"].boolValue
        
        self._id = json["_id"].stringValue
        
        self.userType = UserType(json: json["userType"])
       
        self.sellType = SellType(json: json["sellType"])
        
        self.realEstateType = RealEstateType(json: json["realEstateType"])
        
        self.object = Object(json: json["object"])
        
        self.region = Region(json: json["region"])
        
        self.district = District(json: json["district"])
        
        self.title = json["title"].stringValue
        
        self.filter = json["filter"].arrayValue.map{ Filter(json: $0) }
        
        self.description = json["description"].stringValue
        
        self.autoPayment = json["autoPayment"].boolValue
        
        self.paymentHistory = PaymentHistory(json: json["paymentHistory"])
        
        self.readyToExchange = json["readyToExchange"].boolValue
        
        self.user = json["user"].stringValue
        
        self.totalEndDate = json["totalEndDate"].stringValue
        
        self.topEndDate = json["topEndDate"].stringValue
        
        self.recommendEndDate = json["recommendEndDate"].stringValue
        
        self.createdAt = json["createdAt"].stringValue
        
        self.updatedAt = json["updatedAt"].stringValue
        
        self.maxPrice = json["maxPrice"].doubleValue
        
        self.minPrice = json["minPrice"].doubleValue
        
        self.isTapped = false
        
    }
    
}
