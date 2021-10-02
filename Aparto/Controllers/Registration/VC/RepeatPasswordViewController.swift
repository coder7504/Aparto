//
//  RepeatPasswordViewController.swift
//  Aparto
//
//  Created by Mac user on 01/10/21.
//

import UIKit

class RepeatPasswordViewController: UIViewController {

    @IBOutlet weak var passwordView: CustomTextFieldView! {
        didSet {
            passwordView.topTitle = "Новый пароль"
            passwordView.rightImage = nil
        }
    }
    
    @IBOutlet weak var repeatView: CustomTextFieldView!  {
        didSet {
            repeatView.topTitle = "Повторите новый пароль"
            repeatView.rightImage = nil
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
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        if !passwordView.mainTitle!.isEmpty {
            if passwordView.mainTitle! == repeatView.mainTitle! {
                if Reachability.isConnectedToNetwork() {
                    API.resetPassword(password: passwordView.mainTitle!) { [self] isSave in
                        guard isSave else { return }
                        if isSave {
                            let vc = RegistrationGoBackViewController(nibName: "RegistrationGoBackViewController", bundle: nil)
                            vc.modalPresentationStyle = .overFullScreen
                            present(vc, animated: true, completion: nil)
                        } else {
                            showErrorAlert(title: "Xatolik", message: "Parol almashtirishga qayta urinib kuring")
                        }
                    }
                } else {
                    AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
                }
            } else {
                showWarningAlert(title: "Xatolik", message: "Parolni qayta kiritishda xatolik")
            }
        } else {
            showWarningAlert(title: "Xatolik", message: "Parol kiritishda xatolik")
        }
        
        
        
    }
    
    
}
