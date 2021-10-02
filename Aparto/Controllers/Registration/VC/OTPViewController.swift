//
//  OTPViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class OTPViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var repeatButtonOutlet: UIButton!
    
    @IBOutlet var textFields: [OTPTextField]! {
        didSet {
            for tf in textFields {
                tf.delegate = self
                tf.myDelegate = self
            }
        }
    }
        
    @IBOutlet var underLineViews: [UIView]! {
        didSet {
            for v in underLineViews {
                v.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var confirmButtonOutlet: CustomBtn!
    @IBOutlet weak var repButton: UIButton!
    
    @IBOutlet weak var textFieldView: UIView! {
        didSet {
            textFieldView.layer.borderWidth = 1
            textFieldView.layer.cornerRadius = 8
            textFieldView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07496789382)
        }
    }
    
    var email: String!
    var OTP: String = ""
    var phoneNumber: String = ""
    var name: String = ""
    var surname: String = ""
    var password: String = ""
    var usertype: String = ""
    var isSignIn: Bool = false
    var time = 30
    var navTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTime()
        setDetails()
    }
    
    func setTime() {
        if !isSignIn {
            repButton.isEnabled = false
            timeLabel.textColor = .gr
            repeatButtonOutlet.setTitleColor(.gr, for: .normal)
            timeLabel.text = "\(30)c"
            timeLabel.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] t in
                if time > 0 {
                    time -= 1
                } else {
                    time = 30
                    t.invalidate()
                    repButton.isEnabled = true
                    timeLabel.isHidden = true
                    timeLabel.textColor = .black
                    repeatButtonOutlet.setTitleColor(.black, for: .normal)
                }
                timeLabel.text = "\(time)c"
            }
        }
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = navTitle
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
        
        AuthManager.shared.verifyCode(smsCode: OTP) { [self] success in
            guard success else { return }
            if isSignIn {
                if Reachability.isConnectedToNetwork() {
        //            start loading
                    Loader.start()
        //            Networking
                    API.signUp(userType: usertype, phoneNumber: phoneNumber, firstName: name, lastName: surname, password: password) { (didRegister) in
                        Loader.stop()
                        guard let didRegister = didRegister else { return }
                        if didRegister {
                            Cache.saveUser(password: password)
                            Cache.saveUser(name: name)
                            Cache.saveUser(surname: surname)
                            Cache.saveUser(phoneNumber: phoneNumber)
                            Cache.saveUser(type: usertype)
                            DispatchQueue.main.async {
                                let vc = RegistrationGoBackViewController(nibName: "RegistrationGoBackViewController", bundle: nil)
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                        } else {
                            self.showErrorAlert(title: Keys.a_internet, message: "Ro'yxatdan o'tishda xatolik. Iltimos qaytadan urunib ko'ring.")
                        }
                    }
                    
                } else {
                    AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
                }
            } else {
//                change forgot password
                if Reachability.isConnectedToNetwork() {
                    Loader.start()
                    AuthManager.shared.verifyCode(smsCode: OTP) { [self] success in
                        guard success else { return }
                            Loader.stop()
                            let vc = RepeatPasswordViewController(nibName: "RepeatPasswordViewController", bundle: nil)
                        navigationController?.pushViewController(vc, animated: true)
                    }
                } else {
                    AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
                }
            }
          
            
           
        }
        
      
    }
    
    
    @IBAction func repeatCode(_ sender: Any) {
        Loader.start()
        let nomer = Cache.getUserPhoneNumber()!
        if Reachability.isConnectedToNetwork() {
            if !nomer.isEmpty {
                AuthManager.shared.startAuth(phoneNumber: nomer) {success in
                    Loader.stop()
                    self.setTime()
                    guard success else { return }
                }
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    

}



//  MARK: -- TextFieldDelegate and OTPTextFieldDelegate

extension OTPViewController: UITextFieldDelegate, OTPTextFieldDelegate {
    
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {
        clearing(at: textField as! OTPTextField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        OTP = ""
        textField.text = ""
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var otp = ""
        for t in textFields {
            otp += t.text ?? ""
        }
        if otp.count == 6 {
            OTP = otp
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //2342
        if string.count == 6 {
            
            for (i,v) in string.enumerated() {
                textFields[i].text = String(v)
                underLineViews[i].isHidden = true
            }
            textField.resignFirstResponder()
            return false
            
        } else {
            
            let numberOnly = NSCharacterSet.init(charactersIn: "0123456789")
            let stringFromTextField = NSCharacterSet.init(charactersIn: string)
            let strValid = numberOnly.isSuperset(of: stringFromTextField as CharacterSet)

            if !strValid {return false}
            
            guard let text = string.first else {
                textField.text = nil
                clearing(at: textField as! OTPTextField)
                return false
            }
            
            textField.text = String(text)
            filling(at: textField as! OTPTextField)
            return false
        
        }
    }
    
    fileprivate func animateUndernizeView(at index: Int, isClearing: Bool) {
        UIView.animate(withDuration: 0.2) { [self] in
            if isClearing {
                underLineViews[index].isHidden = false
            } else {
                underLineViews[index].isHidden = true
            }
        }
    }
    
    fileprivate func clearing(at textField: OTPTextField) {
        
        let indexStepBefore = textFields.firstIndex(of: textField)!-1
        
        if indexStepBefore >= 0 {
            textField.resignFirstResponder()
            textFields[indexStepBefore].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        animateUndernizeView(at: textFields.firstIndex(of: textField)!, isClearing: true)
    }
    
    fileprivate func filling(at textField: OTPTextField) {
        
        let indexStepAfter = textFields.firstIndex(of: textField)!+1
        if indexStepAfter < textFields.count {
            if let t = textFields[indexStepAfter].text {
                if t.isEmpty {
                    textFields[indexStepAfter].becomeFirstResponder()
                }
                textField.resignFirstResponder()
            }
        } else {
            textField.resignFirstResponder()
        }
        animateUndernizeView(at: textFields.firstIndex(of: textField)!, isClearing: false)
        
    }
    
}

