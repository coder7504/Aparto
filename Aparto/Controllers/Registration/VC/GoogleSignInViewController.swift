//
//  GoogleSignInViewController.swift
//  Aparto
//
//  Created by Mac user on 01/10/21.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


class GoogleSignInViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


    @IBAction func signInButtonTapped(_ sender: Any) {
        
        if !phoneNumberTextField.text!.isEmpty, let text = phoneNumberTextField.text {
            AuthManager.shared.startAuth(phoneNumber: text) { [self] success in
                guard success else { return }
                print("🤙👍👏")
            }
        }
        
    }
    
    
    
    
    
    
    @IBAction func googleSingIn(_ sender: Any) {
        
        signInWithGoogle()
    }
    

}







//    MARK: --   extension   Sign In With Google


extension GoogleSignInViewController {
    
    fileprivate
    func signInWithGoogle() {
        //        sigin in with google
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        //        Create Google Sigin in Confguration object.
                let confg = GIDConfiguration(clientID: clientID)
                
        ///        start Loader
                Loader.start()
        //        Start the sign in flow!
                GIDSignIn.sharedInstance.signIn(with: confg, presenting: self) { user, error in
                   
                    if let error = error {
                        print("ERROR: \(error.localizedDescription)")
                        Loader.stop()
                        return
                    }
                    
                    guard
                        let authentication = user?.authentication,
                        let idToken = authentication.idToken
                    else {
                        return
                    }
                    
                    print("email 🤙 = ", user?.profile?.email)
                    
                    
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                   accessToken: authentication.accessToken)
                    
                    Auth.auth().signIn(with: credential) { (authData, error) in
                        
                        ///stop Loader
                        Loader.stop()
                        if let error = error {
                            ///need to show error message
                            print(error.localizedDescription)
                            return
                        } else
                        
                        if let authData = authData {
                            
                            if let authAdditional = authData.additionalUserInfo, authAdditional.isNewUser {
                                ///Redirected to Profil fill page
                                let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
                                self.navigationController?.pushViewController(vc, animated: true)
                                
                            } else {
                                
                                ///user with this email is already exists
                                ///create the alert
                                let alert = UIAlertController(title: Keys.a_internet, message: Keys.a_goOnline, preferredStyle: UIAlertController.Style.alert)
                                let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
                                    let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                                    self.navigationController?.pushViewController(vc, animated: true)
                                })
                                alert.addAction(action)
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
    }
    
}
