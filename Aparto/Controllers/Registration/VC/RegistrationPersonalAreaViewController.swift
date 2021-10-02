//
//  RegistrationPersonalAreaViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit

class RegistrationPersonalAreaViewController: UIViewController {

    @IBOutlet weak var nomerView: CustomTextFieldView! {
        didSet {
            nomerView.topTitle = "Новый номер телефона"
            nomerView.mainTitle = "+9989"
            nomerView.titleLabel.keyboardType = .numberPad
            nomerView.rightImage = nil
        }
    }
    @IBOutlet weak var passwordView: CustomTextFieldView!  {
        didSet {
            passwordView.topTitle = "Пароль"
            passwordView.mainTitle = ""
            passwordView.rightImage = nil
            passwordView.titleLabel.keyboardType = .default
            passwordView.titleLabel.isSecureTextEntry = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
        
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Вход в аккаунт"
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

    @IBAction func enteranceButtonTapped(_ sender: Any) {
        
        guard let phoneNumber = nomerView.mainTitle else {
//            show alert
            showErrorAlert(title: Keys.a_error, message: Keys.a_emailCorrectly)
            return
        }
        
        guard let password = passwordView.mainTitle else {
//            show alert
            showErrorAlert(title: Keys.a_error, message: Keys.a_passwordCorrectly)
            return
        }
        
        if Reachability.isConnectedToNetwork() {
//            start loading
            Loader.start()
//            Networking part
            API.signIn(phoneNumber: phoneNumber, password: password) { [self] (didSucced) in
//                stop loading
                Loader.stop()
                guard let didSucced = didSucced else { return }
                if didSucced {
                    /// presenting main VC
                    goToMainApartoViewController()
                } else {
//                    show alert
                    showErrorAlert(title: Keys.a_error, message: "Ro'yxatdan o'tishda xatolik ro'y berdi.")
                }
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
        
    }
    
    fileprivate
    func goToMainApartoViewController() {
        let vc = MainTabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        let vc = RecoveryPasswordViewController(nibName: "RecoveryPasswordViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
