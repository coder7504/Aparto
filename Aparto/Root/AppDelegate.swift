///
//  AppDelegate.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 09/09/21.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleSignIn
import Firebase
import FirebaseAuth
import YandexMapsMobile

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    Yandex Key :   0bf89780-7a7b-462f-ab2c-8923aa2434d3
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        YMKMapKit.setApiKey("0bf89780-7a7b-462f-ab2c-8923aa2434d3")
//        Firebase Configure
        FirebaseApp.configure()
        
//        Cleint ID =  1067869904689-6p0ere7i9l79fj83s6kia1g428jqur1c.apps.googleusercontent.com
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .black
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = MainTabBarViewController()
     //        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
     //        let nav = UINavigationController(rootViewController: vc)
//             let vc = GoogleSignInViewController(nibName: "GoogleSignInViewController", bundle: nil)
//        let vc = SearchFromMapViewController(nibName: "SearchFromMapViewController", bundle: nil)
     //        let vc = OTPViewController(nibName: "OTPViewController", bundle: nil)
             window?.rootViewController = vc
             window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        return true
    }
    
    
}


extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("fcmToken: ", fcmToken ?? "")
    }
    
}


///Google Sign up or others
extension AppDelegate {
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        GIDSignIn.sharedInstance.handle(url)
    }
}


