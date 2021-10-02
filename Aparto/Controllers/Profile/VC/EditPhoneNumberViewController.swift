//
//  EditPhoneNumberViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class EditPhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var editPhoneNumberView: CustomTextFieldView! {
        didSet {
            editPhoneNumberView.topTitle = "Новый номер телефона"
            editPhoneNumberView.mainTitle = "+998"
            editPhoneNumberView.rightImage = nil
        }
    }
    var oldNum: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        phoneNumberLabel.text = oldNum
        addGesture()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Изменить номер"
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
    
    fileprivate
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        editPhoneNumberView.titleLabel.resignFirstResponder()
    }
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        let vc = GetVerificationCodeViewController(nibName: "GetVerificationCodeViewController", bundle: nil)
        vc.hidesBottomBarWhenPushed = false
        Cache.saveUser(phoneNumber: editPhoneNumberView.mainTitle!)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}





