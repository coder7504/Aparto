//
//  ForgotPasswordViewController.swift
//  Aparto
//
//  Created by Mac user on 01/10/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var numberView: CustomTextFieldView! {
        didSet {
            numberView.topTitle = "Номер телефона"
            numberView.mainTitle = "+998"
            numberView.rightImage = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
//        Loader.start()
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Забыл пароль"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
    }
    
    func removeButtomLineNavigation() {
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        guard let phoneNumber = numberView.mainTitle else {
//            show alert
            showErrorAlert(title: Keys.a_error, message: Keys.a_emailCorrectly)
            return
        }
        
        if phoneNumber.isEmpty {
            showWarningAlert(title: Keys.a_error, message: "Ro'yxatdan o'tishda xatolik ro'y berdi.")
        } else {
            if Reachability.isConnectedToNetwork() {
                Loader.start()
                AuthManager.shared.startAuth(phoneNumber: phoneNumber) { [self] success in
                    Loader.stop()
                    guard success else { return }
                    goToOTPViewController(number: phoneNumber)
                }
            } else {
                AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
            }
        }
        
    }
    
    
    fileprivate
    func goToOTPViewController(number: String) {
        let vc = OTPViewController(nibName: "OTPViewController", bundle: nil)
        vc.phoneNumber = number
        vc.isSignIn = false
        vc.navTitle = "Забыл пароль"
        navigationController?.pushViewController(vc, animated: true)
    }
    
 
}
