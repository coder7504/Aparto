//
//  RandomAdvertisement.swift
//  Aparto
//
//  Created by Mac user on 05/10/21.
//

import Foundation
import SwiftyJSON

class RandomAdvertisement {
    
    var _id: String
    var image: String
    var clicked: Int
    var seen: Int
    var createdAt: String
    var endDate: String
    var title: String
    var addtype: String
    var link: String
    var developer: String
    
    init() {
        title = ""
        _id = ""
        clicked = 0
        createdAt = ""
        image = ""
        endDate = ""
        seen = 0
        addtype = ""
        link = ""
        developer = ""
    }
    
    init(_id: String,image: String,clicked: Int,seen: Int,createdAt: String,endDate: String,title: String,addtype: String,link: String,developer: String) {
        
        self._id = _id
        self.image = image
        self.clicked = clicked
        self.seen = seen
        self.createdAt = createdAt
        self.endDate = endDate
        self.title = title
        self.addtype = addtype
        self.link = link
        self.developer = developer
    }
    
    init(json: JSON) {
        self.title  = json["title"].stringValue
        self._id    = json["_id"].stringValue
        self.image = json["image"].stringValue
        self.createdAt  = json["createdAt"].stringValue
        self.endDate   = json["endDate"].stringValue
        self.addtype  = json["addtype"].stringValue
        self.link  = json["link"].stringValue
        self.seen   = json["seen"].intValue
        self.clicked   = json["clicked"].intValue
        self.developer = json["developer"].stringValue
    }
    

}
