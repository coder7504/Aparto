//
//  Cashe.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/25/21.
//

import Foundation



class Cache {
    
    static func set(appLanguage: AppLanguage) {
        let newLang: String = appLanguage.rawValue
        UserDefaults.standard.setValue(newLang, forKey: Keys.LANGUAGE)
    }
    
    static func getAppLanguage() -> AppLanguage {
        let lang = UserDefaults.standard.string(forKey: Keys.LANGUAGE)
        if let lang = lang {
            if lang == "uz" {return .uz}
            if lang == "ru" {return .ru}
            if lang == "en" {return .en}
        } else {
            return .uz
        }
        return .uz
    }
    
    static func save(token: String) {
        UserDefaults.standard.setValue(token, forKey: Keys.TOKEN)
    }
    
    static func getToken() -> String {
        UserDefaults.standard.string(forKey: Keys.TOKEN) ?? "No token"
    }
    
    
    
//    save cuurentUser datas
    
    static func save(_id: String) {
        UserDefaults.standard.setValue(_id, forKey: Keys.CURRENTUSERID)
    }
    
    static func getUserId() -> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERID)
    }
    
    static func saveUser(name: String) {
        UserDefaults.standard.setValue(name, forKey: Keys.CURRENTUSERNAME)
    }
    
    static func getUserName()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERNAME)
    }
    
    static func saveUser(surname: String) {
        UserDefaults.standard.setValue(surname, forKey: Keys.CURRENTUSERSURNAME)
    }
    
    static func getUserSurname()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERSURNAME)
    }
    
    static func saveUser(phoneNumber: String) {
        UserDefaults.standard.setValue(phoneNumber, forKey: Keys.CURRENTUSERPHONENUMBER)
    }
    
    static func getUserPhoneNumber()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERPHONENUMBER)
    }
    
    static func saveUser(birthday: String) {
        UserDefaults.standard.setValue(birthday, forKey: Keys.CURRENTUSERBIRTHDAY)
    }
    
    static func getUserBirthday()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERBIRTHDAY)
    }
    
    static func saveUser(gender: String) {
        UserDefaults.standard.setValue(gender, forKey: Keys.CURRENTUSERGENDER)
    }
    
    static func getUserGender()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERGENDER)
    }
    
    static func saveUser(email: String) {
        UserDefaults.standard.setValue(email, forKey: Keys.CURRENTUSEREMAIL)
    }
    
    static func getUserEmail()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSEREMAIL)
    }
    
    static func saveUser(password: String) {
        UserDefaults.standard.setValue(password, forKey: Keys.CURRENTUSERPASSWORD)
    }
    
    static func getUserPassword()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERPASSWORD)
    }
    
    static func saveUser(type: String) {
        UserDefaults.standard.setValue(type, forKey: Keys.CURRENTUSERTYPE)
    }
    
    static func getUserType()-> String? {
        UserDefaults.standard.string(forKey: Keys.CURRENTUSERTYPE)
    }
    
    static func save(nwesLength: Int) {
        UserDefaults.standard.setValue(nwesLength, forKey: Keys.news_length)
    }
    
    static func getNewsLength()-> Int? {
        UserDefaults.standard.integer(forKey: Keys.news_length)
    }
    
    
    static func save(announcementLength: Int) {
        UserDefaults.standard.setValue(announcementLength, forKey: Keys.get_top_announcement_length)
    }
    
    static func getTopAnnouncementLength()-> Int? {
        UserDefaults.standard.integer(forKey: Keys.get_top_announcement_length)
    }
    
}
