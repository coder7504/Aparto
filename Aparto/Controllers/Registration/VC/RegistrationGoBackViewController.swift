//
//  RegistrationGoBackViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit

class RegistrationGoBackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setDetails()
        
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Регистрация: Частное лицо"
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

    @IBAction func backButtonTapped(_ sender: Any) {
        let count = navigationController?.viewControllers
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.popToViewController(count![count!.count-5], animated: true)
    }

}
