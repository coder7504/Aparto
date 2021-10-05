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
    var newsCategory: NewsCategory
    var image: String
    var liked: Int
    var seen: Int
    
    init() {
        title = ""
        description = ""
        likedUsers = []
        createdAt = ""
        newsCategory = NewsCategory(name: Population(en: "", ru: "", uz: ""), _id: "")
        image = ""
        liked = 0
        seen = 0
    }
    
    
    init(title: String,description: String,likedUsers: [String],createdAt: String,newsCategory: NewsCategory,image: String,liked: Int,seen: Int) {
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
        self.newsCategory   = NewsCategory(name: Population(en: json["newsCategory"]["name"]["en"].stringValue, ru: json["newsCategory"]["name"]["ru"].stringValue, uz: json["newsCategory"]["name"]["uz"].stringValue), _id: json["newsCategory"]["_id"].stringValue)
        self.image  = json["image"].stringValue
        self.liked  = json["liked"].intValue
        self.seen   = json["seen"].intValue
    }
    

}
