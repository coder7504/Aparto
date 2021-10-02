//
//  Publication.swift
//  Juft
//
//  Created by Mac user on 10/08/21.
//

import UIKit


class Population {
    
    var en: String
    var ru: String
    var uz: String
    
    init(en: String,ru: String, uz: String) {
        self.en = en
        self.ru = ru
        self.uz = uz
    }
    
    init() {
        self.en = ""
        self.ru = ""
        self.uz = ""
    }
    
}

