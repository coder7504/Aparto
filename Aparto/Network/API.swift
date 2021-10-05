//
//  API.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/25/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    static let baseUrl: String = "https://aparto.albison.software/api"
    
    struct EndPoints {
        static var signIn = "/v1/user/is-user-active"
        static var signUp = "/v1/user"
        static var userType = "/v1/user-type"
        static var updateUser = "/v1/user/\(Cache.getUserId() ?? "614f8eeb7a9b2153bfffcf98")"
        static var allCopmlainCategory = "/v1/complain-category"
        static var createComplain = "/v1/complain"
        static var rentCategory = "/v1/rent-type"
        static var currency = "/v1/currency"
        static var aboutUs = "/v1/general-settings"
        static var help = "/v1/faq"
        static var changePassword = "/v1/user/change-password/\(Cache.getUserId() ?? "6154e3241ce2c8b3d787687a")"
        static var newsCategory = "/v1/news-category"
        static var news = "/v1/news"
        static var sellTpye = "/v1/sell-type"
        static var resetPassword = "/v1/user/reset-password/\(Cache.getToken())"
        static var randomAdvertisement = "/v1/income/random"
        static var allRegion = "/v1/region"
    }
    
    static private var signInUrl: URL = URL(string: baseUrl + EndPoints.signIn)!
    static private var userTypeUrl: URL = URL(string: baseUrl + EndPoints.userType)!
    static private var signUp: URL = URL(string: baseUrl + EndPoints.signUp)!
    static private var updateUserUrl: URL = URL(string: baseUrl + EndPoints.updateUser)!
    static private var allComplainCategoryUrl: URL = URL(string: baseUrl + EndPoints.allCopmlainCategory)!
    static private var createComplainUrl: URL = URL(string: baseUrl + EndPoints.createComplain)!
    static private var rentCategoryUrl: URL = URL(string: baseUrl + EndPoints.rentCategory)!
    static private var currencyUrl: URL = URL(string: baseUrl + EndPoints.currency)!
    static private var aboutUsUrl: URL = URL(string: baseUrl + EndPoints.aboutUs)!
    static private var helpUrl: URL = URL(string: baseUrl + EndPoints.help)!
    static private var changePasswordUrl: URL = URL(string: baseUrl + EndPoints.changePassword)!
    static private var newsCategoryUrl: URL = URL(string: baseUrl + EndPoints.newsCategory)!
    static private var newsUrl: URL = URL(string: baseUrl + EndPoints.news)!
    static private var sellTypeUrl: URL = URL(string: baseUrl + EndPoints.sellTpye)!
    static private var resetPassworUrl: URL = URL(string: baseUrl + EndPoints.resetPassword)!
    static private var randomAdvertisementUrl: URL = URL(string: baseUrl + EndPoints.randomAdvertisement)!
    static private var allRegionUrl: URL = URL(string: baseUrl + EndPoints.allRegion)!
    
    
//    APIs
    
//    signIn
    
    class func signIn(phoneNumber: String, password: String, completion: @escaping (Bool?) -> Void ) {
        
        let params = [
            "phoneNumber"   :   phoneNumber,
            "password"      :   password
        ]
        
        NET.request(from: signInUrl, method: .post, params: params) { (data) in
            guard let data = data else {completion(nil); return}
            if let token = data["token"].string {
                print("signin = ", data)

                Cache.saveUser(name: data["user"]["firstName"].stringValue)
                Cache.saveUser(surname: data["user"]["lastName"].stringValue)
                Cache.saveUser(birthday: data["user"]["birthday"].stringValue)
                Cache.saveUser(phoneNumber: data["user"]["phoneNumber"].stringValue)
                Cache.saveUser(gender: data["user"]["gender"].stringValue)
                Cache.saveUser(email: data["user"]["email"].stringValue)
                Cache.save(_id: data["user"]["_id"].stringValue)
//                save token
                Cache.save(token: token)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
//    signUp
    
    class func signUp(userType: String, phoneNumber: String, firstName: String, lastName: String, password: String, completion: @escaping (Bool?) -> Void ) {
        
        let params = [
            "userType"      :     userType,
            "phoneNumber"   :  phoneNumber,
            "firstName"     :    firstName,
            "lastName"      :     lastName,
            "password"      :     password,
        ]
        
        
        NET.simpleRequest(from: signUp, method: .post, params: params) { (data) in
            guard let data = data else { completion(nil); return}
            print("Sign Up = ", data)
            if let token = data["token"].string {
//                save token
                Cache.save(token: token)
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
    
//    getUserType
    
    class func getUserType(completion: @escaping ([UserType]?) -> Void) {
        
//        let params: [String: Any] = [
//            "populate" : "name"
//        ]
        
        NET.simpleRequest(from: userTypeUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            print("UserType = ",data)
            if let subData = data["data"].array {
                let userTypes = subData.map{ UserType(json: $0) }
                completion(userTypes)
            } else {
                completion(nil)
            }
        }
        
    }
    
//  update user
    
    class func updateUser(birthday: String, gender: String, phoneNumber: String, name: String, surname: String, email: String, completion: @escaping (Bool?) -> Void ) {
        let params = [
            "phoneNumber"   : phoneNumber,
            "firstName"     :        name,
            "lastName"      :     surname,
            "email"         :       email,
            "birthday"      :    birthday,
            "gender"        :      gender
        ]
        
        NET.request(from: updateUserUrl, method: .patch, params: params) { (data) in
//            print("URL = ",updateUserUrl)
            guard let data = data else { completion(nil); return }
            print(data["status"].stringValue,"Update User = ", data)
            if data["status"].stringValue == "success" {
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
//    delete user
    
    class func deleteUser(completion: @escaping (Bool?) -> Void ) {
        
        NET.request(from: updateUserUrl, method: .patch, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            if data["status"].stringValue == "success" {
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
    
//    get all complain
    
    class func getCopmlainCategory(completion: @escaping ([ComplainCategory]?) -> Void ) {
        
        NET.simpleRequest(from: allComplainCategoryUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            print("complain category = ", data)
            if data["status"].stringValue == "success" {
                if let subData = data["data"].array {
                    let allCategory = subData.map{ ComplainCategory(id: $0["_id"].stringValue, name: Population(en: $0["name"]["en"].stringValue, ru: $0["name"]["ru"].stringValue, uz: $0["name"]["uz"].stringValue), complainType: $0["complainType"].stringValue) }
                    completion(allCategory)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    
//    Create complain
    
    class func createComplain(userId: String, announcementId: String, complainCategoryId: String, completion: @escaping (Bool?) -> Void ) {
        
        let params = [
            "user"              :               userId,
            "announcement"      :       announcementId,
            "complainCategory"  :   complainCategoryId
        ]
        
        NET.request(from: createComplainUrl, method: .post, params: params) { (data) in
            guard let data = data else { completion(nil); return }
            if data["status"].stringValue == "success" {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
//     get rent category
    
    class func getRentCategory(completion: @escaping ([RentCategory]?) -> Void ) {
        
        NET.simpleRequest(from: rentCategoryUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            if let subData = data["data"].array {
                let categoryData = subData.map{ RentCategory(name: Population(en: $0["name"]["en"].stringValue, ru: $0["name"]["ru"].stringValue, uz: $0["name"]["uz"].stringValue), _id: $0["_id"].stringValue) }
                completion(categoryData)
            } else {
                completion(nil)
            }
        }
    }
    
    
//    get currency
    
    class func getAllCurrency(completion: @escaping ([Currency]?) -> Void ) {
    
        NET.simpleRequest(from: currencyUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            if let subData = data["data"].array {
                let allCurrency = subData.map{ Currency(id: $0["name"].stringValue , name: $0["name"].stringValue, currencyRate: $0["currencyRate"].intValue) }
                completion(allCurrency)
            } else {
                completion(nil)
            }
        }
    }
    
//    get General Settings
    
    class func getAboutUs(completion: @escaping ([AboutUs]?) -> Void ) {
        
        NET.simpleRequest(from: aboutUsUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            print("about us = ", data)
            if let subData = data["data"].array {
                let allData = subData.map{ AboutUs(json: $0) }
                completion(allData)
            } else {
                completion(nil)
            }
        }
    }
    
//    get FAQ
    
    class func getFAQ(completion: @escaping ([HelpFromUs]?) -> Void ) {
        
        NET.simpleRequest(from: helpUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            print("FAQ = ", data)
            if let subData = data["data"].array {
                let allData = subData.map{ HelpFromUs(json: $0) }
                completion(allData)
            } else {
                completion(nil)
            }
        }
    }
    
//    change Password
    
    class func changePassword(currentPassword: String,newPassword: String ,completion: @escaping (Bool) -> Void) {
        
        let params = [
            "currentPassword": currentPassword,
            "newPassword": newPassword
        ]
        
        NET.request(from: changePasswordUrl, method: .put, params: params) { (data) in
            guard let data = data else { completion(false); return }
            if data["status"].stringValue == "success" {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
//    get News Category
    
    class  func getNewsCategory(completion: @escaping ([NewsCategory]?) -> Void) {

        NET.simpleRequest(from: newsCategoryUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            if data["status"].stringValue == "success" {
               if let newsCategory = data["data"].array {
                    let allData = newsCategory.map{ NewsCategory(json: $0) }
                    completion(allData)
               } else {
                completion(nil)
               }
            } else {
                completion(nil)
            }
        }
    }
    
    
//     get News
    
    class func getNews(completion: @escaping ([News]?) -> Void ) {
        
        let params: [String: Any] = [
            "popOptions" : "newsCategory"
        ]
        
        NET.simpleRequestWithoutEncoding(from: newsUrl, method: .get, params: params) { (data) in
            guard let data = data else { completion(nil); return }
//            print("news ⛑⛑⛑⛑⛑", data)
            if data["status"].stringValue == "success" {
               if let newsCategory = data["data"].array {
                    let allData = newsCategory.map{ News(json: $0) }
                    completion(allData)
               } else {
                completion(nil)
               }
            } else {
                completion(nil)
            }
        }
    }
    
    
//    get Sell Type
    
    class func getSellType(completion: @escaping ([SellType]?) -> Void ) {
        
        NET.simpleRequest(from: sellTypeUrl, method: .get, params: nil) { (data) in
            guard let data = data else { completion(nil); return }
            if data["status"].stringValue == "success" {
               if let sellTypeData = data["data"].array {
                    let allData = sellTypeData.map{ SellType(json: $0) }
                    completion(allData)
               } else {
                completion(nil)
               }
            } else {
                completion(nil)
            }
        }
    }
    
    
//    reset password
    
    class func resetPassword(password: String, completion: @escaping (Bool) -> Void ) {
        
        let params = [
            "password": password
        ]

        NET.simpleRequest(from: resetPassworUrl, method: .post, params: params) { data in
            guard let data = data else { completion(false); return }
            if data["status"].string == "success" {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
//    get Random Advertisement
    
    class func getRandomAdvertisement(addType: String, completion: @escaping ([RandomAdvertisement]?) -> Void) {
        
        let params = [
            "addType": addType
        ]
        print(randomAdvertisementUrl, "URL")
        NET.simpleRequest(from: randomAdvertisementUrl, method: .get, params: params) { data in
            guard let data = data else { completion(nil); return }
            print("getRandomAdvertisement 👀👀👀👀👀 = ", data)
            if data["status"].stringValue == "success" {
                if let subData = data["data"].array {
                    let ad = subData.map{ RandomAdvertisement(json: $0) }
                    completion(ad)
                }
            } else {
                completion(nil)
            }
        }
    }
    
//    get AllRegion
    
    class func getAllRegion(completion: @escaping ([UserType]?) -> Void ) {
        
        
        NET.simpleRequest(from: allRegionUrl, method: .get, params: nil) { data in
            guard let data = data else { completion(nil); return }
            print("Region = ", data)
            if data["status"].stringValue == "success" {
                if let subData = data["data"].array {
                    let region = subData.map{ UserType(json: $0) }
                    completion(region)
                }
            } else {
                completion(nil)
            }
        }
        
    }
    
    
}
