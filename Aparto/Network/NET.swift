//
//  NET.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/25/21.
//

import Foundation
import SwiftyJSON
import Alamofire


class NET {
    
    static var commonHeader: HTTPHeaders {
       [
        "Accept": "application/json",
        "Content-Type": "application/json",
       ]
    }
    
    static var tokenHeader: HTTPHeaders {
       [
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "\(Cache.getToken())"
       ]
    }
    
    
    class func simpleRequest(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: commonHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                switch response.result {
                case .success(_): completion(JSON(response.data!))
                case .failure(_): print(response.error.debugDescription); completion(nil)
                }

            }
        } else {
            
            AlertNET.showAlertRegistration(title: Keys.a_internet , message: Keys.a_goOnline ) { (_) in }
        }
        
    }
    
    
    class func simpleRequestWithoutEncoding(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, headers: commonHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                switch response.result {
                case .success(_): completion(JSON(response.data!))
                case .failure(_): completion(nil)
                }

            }
        } else {
            
            AlertNET.showAlertRegistration(title: Keys.a_internet , message: Keys.a_goOnline ) { (_) in }
        }
        
    }
    
    
    class func request(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: tokenHeader).responseJSON { (response) in

                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                
                switch response.result {
                case .success(_): completion(JSON(response.data!))
                case .failure(_): print(response.error.debugDescription); completion(nil)
                }
                
            }
        } else {
            AlertNET.showAlertRegistration(title: Keys.a_internet , message: Keys.a_goOnline ) { (_) in }
        }
        
    }
    
    
    class func requestWithURLEncoding(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: tokenHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                
                switch response.result {
                case .success(_): completion(JSON(response.data!))
                case .failure(_): completion(nil)
                }
                
            }
        } else {
            AlertNET.showAlertRegistration(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
        
    }
    
    
    
    
}
