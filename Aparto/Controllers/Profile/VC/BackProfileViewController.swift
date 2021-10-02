//
//  EditOrBacProfileViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class BackProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
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
        //        let vc = MyProfileViewController()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        //        print(viewControllers.count)
        //        for aViewController in viewControllers {
        //            print("for ga kirdi")
        //            if aViewController == vc {
        //                print("topdi")
        self.navigationController!.popToViewController(viewControllers[viewControllers.count-4], animated: true)
        //            }
        //        }
    }
    
}
