//
//  News.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/30/21.
//

import Foundation
import SwiftyJSON


class News {
    
    var title: String
    var description: String
    var likedUsers: [String]
    var createdAt: String
    var newsCategory: String
    var image: String
    var liked: Int
    var seen: Int
    
    init() {
        title = ""
        description = ""
        likedUsers = []
        createdAt = ""
        newsCategory = ""
        image = ""
        liked = 0
        seen = 0
    }
    
    
    init(title: String,description: String,likedUsers: [String],createdAt: String,newsCategory: String,image: String,liked: Int,seen: Int) {
        self.title  =   title
        self.description    =   description
        self.likedUsers =   likedUsers
        self.createdAt  =   createdAt
        self.newsCategory   =   newsCategory
        self.image  =   image
        self.liked  =   liked
        self.seen   =   seen
    }
    
    init(json: JSON) {
        self.title  = json["title"].stringValue
        self.description    = json["description"].stringValue
        self.likedUsers = json["likedUsers"].arrayValue.map{ $0.stringValue }
        self.createdAt  = json["createdAt"].stringValue
        self.newsCategory   = json["newsCategory"].stringValue
        self.image  = json["image"].stringValue
        self.liked  = json["liked"].intValue
        self.seen   = json["seen"].intValue
    }
    

}
