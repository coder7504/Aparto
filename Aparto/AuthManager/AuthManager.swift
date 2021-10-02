//
//  AuthManager.swift
//  Aparto
//
//  Created by Mac user on 01/10/21.
//

import Foundation
import FirebaseAuth


//    ishlatiladigan view controllerda yoziladi

//
//import Firebase
//import FirebaseAuth
//
//
//
//@IBAction func signInButtonTapped(_ sender: Any) {
//
//    if !phoneNumberTextField.text!.isEmpty, let text = phoneNumberTextField.text {
//        AuthManager.shared.startAuth(phoneNumber: text) { [self] success in
//            guard success else { return }
//            print("🤙👍👏")
//        }
//    }
//    
//}


class AuthManager {
    
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private var verificationId: String?
    
    public func startAuth(phoneNumber: String,  completion: @escaping(Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
            guard let verificationId = verificationId , error == nil else { completion(false); return }
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    public func verifyCode(smsCode: String,  completion: @escaping(Bool) -> Void) {
        guard let verificationId = verificationId else { completion(false); return }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationId,
            verificationCode: smsCode)
        
        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else { completion(false); return }
            completion(true)
        }
        
    }
    
}
