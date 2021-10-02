//
//  MyProfileSettingsViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileSettingsViewController: UIViewController {
    
    @IBOutlet weak var locationSwitchButton: UISwitch!
    @IBOutlet weak var notificationSwitchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
        locationSwitchButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        notificationSwitchButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Настройки"
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
    
    
    
    
}
