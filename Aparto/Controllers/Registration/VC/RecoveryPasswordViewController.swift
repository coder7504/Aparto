//
//  RecoveryPasswordViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit

class RecoveryPasswordViewController: UIViewController {

    @IBOutlet weak var numberView: CustomTextFieldView! {
        didSet {
            numberView.topTitle = "Новый номер телефона"
            numberView.mainTitle = "+998"
            numberView.rightImage = nil
        }
    }
    
    @IBOutlet weak var oldPasswordView: CustomTextFieldView! {
        didSet {
            oldPasswordView.topTitle = "Старый пароль"
            oldPasswordView.rightImage = nil
        }
    }
    
    @IBOutlet weak var newPasswordView: CustomTextFieldView! {
        didSet {
            newPasswordView.topTitle = "Новый пароль"
            newPasswordView.rightImage = nil
        }
    }
    
    @IBOutlet weak var repeatNewPasswordView: CustomTextFieldView! {
        didSet {
            repeatNewPasswordView.topTitle = "Повторите новый пароль"
            repeatNewPasswordView.rightImage = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
//        Loader.start()
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Восстановление пароля"
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
        Loader.start()
        changePassword()
//        let count = navigationController?.viewControllers
//        navigationController?.popToViewController(count![count!.count-3], animated: true)
    }
    
    func changePassword() {
        if newPasswordView.mainTitle == repeatNewPasswordView.mainTitle {
            if Reachability.isConnectedToNetwork() {
                API.changePassword(currentPassword: oldPasswordView.mainTitle!, newPassword: newPasswordView.mainTitle!) { [self] (isChange) in
                    Loader.stop()
                    if isChange {
                        showWarningAlert(title: "Success", message: "Parol muvaffaqiyatli almashtirildi")
                    } else {
                        showErrorAlert(title: "Xatolik", message: "Parol almashtirishda xatolik ro'y berdi. Iltimos qayta urinib ko'ring")
                    }
                }
            } else {
                AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
            }
        } else {
            showWarningAlert(title: "Xatolik", message: "Parolni qayta kiritishda xatolik ro'y berdi")
        }
    }
    
}
