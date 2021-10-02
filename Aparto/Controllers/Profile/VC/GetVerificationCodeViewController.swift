//
//  EnterVerificationCodeViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class GetVerificationCodeViewController: UIViewController {
    
    @IBOutlet weak var writeCodeView: CustomTextFieldView! {
        didSet {
            writeCodeView.topTitle = "Проверочный код"
            writeCodeView.rightImage = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Введите проверочный код"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        if Reachability.isConnectedToNetwork() {
            API.updateUser( birthday: Cache.getUserBirthday()!, gender: Cache.getUserGender()!, phoneNumber: Cache.getUserPhoneNumber()!,name: Cache.getUserName()!, surname: Cache.getUserSurname()!, email: Cache.getUserEmail()!) { [self] (isSaved) in
                guard let isSaved = isSaved else { return }
                if isSaved {
                    let vc = BackProfileViewController(nibName: "BackProfileViewController", bundle: nil)
                    vc.hidesBottomBarWhenPushed = false
                    navigationController?.pushViewController(vc, animated: true)
                } else {
                    AlertNET.showAlert(title: Keys.a_internet, message: "Ma'lumotlarni saqlashda xatolik. Iltimos qaytadan urunib ko'ring.") { (_) in }
                }
            }
        } else {
            showErrorAlert(title: Keys.a_internet, message: Keys.a_goOnline)
        }
        
        
 
    }
    
}





