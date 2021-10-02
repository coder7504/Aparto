//
//  AlertView.swift
//  ReduzTeacher
//
//  Created by Administrator on 16/02/21.
//

import UIKit

let screenSizeNET = UIScreen.main.bounds

class AlertViewNET: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.tag = 9988
    }
    
}


class AlertNET {
    
    static var completion: ((Bool) -> Void)?
    
    class func showAlert(title: String, message: String, completion: @escaping (Bool) -> Void) {
        
        self.completion = completion
        
        let backgroundView = AlertViewNET(frame: screenSizeNET)
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549715638, green: 0.263189882, blue: 0.3012534678, alpha: 0.5)
        
        let messageView = UIView()
        messageView.layer.cornerRadius = 10
        messageView.backgroundColor = .white
        backgroundView.addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        messageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        messageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 40).isActive = true
        messageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -40).isActive = true
        
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "ProximaNova-Bold", size: 18)
        messageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20).isActive = true
        
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 3
        messageLabel.font = UIFont(name: "ProximaNova-Light", size: 15)
        messageView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -20).isActive = true
        
        
        
        
        let acceptButton = UIButton()
        acceptButton.backgroundColor = .white
        acceptButton.setTitle("Yes", for: .normal)
        acceptButton.setTitleColor(.red, for: .normal)
        acceptButton.titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 15)
        acceptButton.clipsToBounds = true
        acceptButton.layer.cornerRadius = 10
        acceptButton.addTarget(self, action: #selector(AlertNET.alertAcceptButtonTapped), for: .touchUpInside)
        backgroundView.addSubview(acceptButton)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 10).isActive = true
        acceptButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -40).isActive = true
        acceptButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        acceptButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 15)
        cancelButton.backgroundColor = UIColor.main
        cancelButton.clipsToBounds = true
        cancelButton.layer.cornerRadius = 10
        cancelButton.addTarget(self, action: #selector(AlertNET.alertCancelButtonTapped), for: .touchUpInside)
        backgroundView.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 10).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 40).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: acceptButton.leadingAnchor, constant: -10).isActive = true
        
        
        

        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(9988) {
                vi.removeFromSuperview()
            }
            window.addSubview(backgroundView)
        }
        
        messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        cancelButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        acceptButton.transform = CGAffineTransform(scaleX: 0, y: 0)

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            messageView.transform = .identity
            cancelButton.transform = .identity
            acceptButton.transform = .identity
        } completion: { (_) in }
    }
    
    
    @objc class func alertCancelButtonTapped() {
        print("Cancel Button tapped")
        completion!(false)
        removeFromSuperView()
    }
    
    @objc class func alertAcceptButtonTapped() {
        print("Done Button tapped")
        completion!(true)
        removeFromSuperView()

    }
    
    class func removeFromSuperView() {
        if let _ = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(9988) {
                
                vi.removeFromSuperview()
                
            }
        }
    }
    
}


extension AlertNET {
    
    
    class func showAlertRegistration(title: String, message: String, completion: @escaping (Bool) -> Void) {
        
        self.completion = completion
        
        let backgroundView = AlertViewNET(frame: screenSizeNET)
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549715638, green: 0.263189882, blue: 0.3012534678, alpha: 0.2404343561)
        
        let messageView = UIView()
        messageView.layer.cornerRadius = 20
        messageView.backgroundColor = .white
        backgroundView.addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        messageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        messageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 40).isActive = true
        messageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -40).isActive = true
        
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "ProximaNova-Bold", size: 18)
        messageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20).isActive = true
        
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 3
        messageLabel.font = UIFont(name: "ProximaNova-Regular", size: 15)
        messageView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -20).isActive = true
        
        
        
        
        let acceptButton = UIButton()
        acceptButton.backgroundColor = .white
        acceptButton.setTitle("OK", for: .normal)
        acceptButton.setTitleColor(UIColor.main, for: .normal)
        acceptButton.titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 15)
        acceptButton.clipsToBounds = true
        acceptButton.layer.cornerRadius = 10
        acceptButton.addTarget(self, action: #selector(AlertNET.alertAcceptButtonTapped), for: .touchUpInside)
        backgroundView.addSubview(acceptButton)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 20).isActive = true
        acceptButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -40).isActive = true
        acceptButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 40).isActive = true
        acceptButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    
        
        

        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(9988) {
                vi.removeFromSuperview()
            }
            window.addSubview(backgroundView)
        }
        
        messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        acceptButton.transform = CGAffineTransform(scaleX: 0, y: 0)

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            messageView.transform = .identity
            acceptButton.transform = .identity
        } completion: { (_) in }
    
    }
    
    
    
}
