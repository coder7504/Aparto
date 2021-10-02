//
//  RegisterViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var accountTypeView: UIView!
    @IBOutlet weak var userTypeLabel: UILabel!
    
    @IBOutlet weak var nomerView: CustomTextFieldView! {
        didSet {
            nomerView.topTitle = "Номер"
            nomerView.mainTitle = "+998 90 888 77 66"
            nomerView.rightImage = nil
        }
    }
    
    @IBOutlet weak var nameView: CustomTextFieldView! {
        didSet {
            nameView.topTitle = "Имя"
            nameView.mainTitle = "Аблулла"
            nameView.rightImage = nil
        }
    }
    
    @IBOutlet weak var surnameView: CustomTextFieldView! {
        didSet {
            surnameView.topTitle = "Фамилия"
            surnameView.mainTitle = ""
            surnameView.rightImage = nil
        }
    }
    
    @IBOutlet weak var passwordView: CustomTextFieldView! {
        didSet {
            passwordView.topTitle = "Пароль"
            passwordView.mainTitle = ""
            passwordView.rightImage = nil
            passwordView.titleLabel.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var repeatPasswordView: CustomTextFieldView! {
        didSet {
            repeatPasswordView.topTitle = "Повторите пароль"
            repeatPasswordView.mainTitle = ""
            repeatPasswordView.rightImage = nil
        }
    }
    
    var userTypeID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDetails()
        
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Регистрация"
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

    @IBAction func continueButtonTapped(_ sender: Any) {
        
        guard let name = nameView.mainTitle else {
            showWarningAlert(title: "Xatolik", message: "Ism kiritishda xatolik !!!")
            return
        }
        
        guard let surname = surnameView.mainTitle else {
            showWarningAlert(title: "Xatolik", message: "Familiya kiritishda xatolik !!!")
            return
        }
        
        guard let nomer = nomerView.mainTitle else {
            showWarningAlert(title: "Xatolik", message: "Nomer kiritishda xatolik !!!")
            return
        }
        
        guard let password = passwordView.mainTitle else {
            showWarningAlert(title: "Xatolik", message: "Parol kiritishda xatolik !!!")
            return
        }
        
        guard let repeatPassword = repeatPasswordView.mainTitle else {
            showWarningAlert(title: "Xatolik", message: "Parolni qayta kiritishda xatolik !!!")
            return
        }
      
//        if userTypeID.isEmpty {
//            showWarningAlert(title: "Xatolik", message: "User type kiritishda xatolik !!!")
//        } else {
            if nomer.isEmpty {
                showWarningAlert(title: "Xatolik", message: "Nomer kiritishda xatolik !!!")
            } else {
                if name.isEmpty {
                    showWarningAlert(title: "Xatolik", message: "Ismingizni kiritishda xatolik !!!")
                } else {
                    if surname.isEmpty {
                        showWarningAlert(title: "Xatolik", message: "Familiyayingizni kiritishda xatolik !!!")
                    } else {
                        if password.isEmpty {
                            showWarningAlert(title: "Xatolik", message: "Parol kiritishda xatolik !!!")
                        } else {
                            if repeatPassword == password {
                                if Reachability.isConnectedToNetwork() {
                                    Loader.start()
                                    if !nomer.isEmpty {
                                        AuthManager.shared.startAuth(phoneNumber: nomer) { [self] success in
                                            Loader.stop()
                                            guard success else { return }
                                            goToOTPViewController(name: name, phone: nomer, surname: surname, password: password, usertype: userTypeID)
                                        }
                                    }
                                } else {
                                    AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
                                }
                                
                            } else {
                                showErrorAlert(title: Keys.a_internet, message: "Parolni qayta kiritishda xatolik")
                            }
                        }
                    }
                }
            }
//        }
        
    }
    
    fileprivate
    func goToOTPViewController(name: String, phone: String, surname: String, password: String, usertype: String) {
        let vc = OTPViewController(nibName: "OTPViewController", bundle: nil)
        vc.isSignIn = true
        vc.phoneNumber = phone
        vc.password = password
        vc.name = name
        vc.surname = surname
        vc.usertype = usertype
        vc.navTitle = "Регистрация: Частное лицо"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func userTypeButtonTapped(_ sender: Any) {
        let vc = UserTypeViewController(nibName: "UserTypeViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate  = self
        present(vc, animated: false, completion: nil)
    }
    

}



extension RegisterViewController: UserTypeDelegate {
    func userType(type: String, id: String) {
        userTypeLabel.text = type
        userTypeID = id
    }
}
