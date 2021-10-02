//
//  Language.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/26/21.
//

import Foundation


class Language {
    
    enum Components: String {

//        label
        case l_lang
        
//        buttons
            
    }
    
    static func getValue(in c: Components) -> String {
        let lang = Cache.getAppLanguage()
        if lang == .uz {
            switch c {
            
//            labels
            case .l_lang: return "uz"
            
//          butttons
                
            
            }
        }
        
        if lang == .ru {
            return "Руский"
        }
        
        if lang == .en {
            return "English"
        }
        
        return "Uz"
        
    }
    
}
