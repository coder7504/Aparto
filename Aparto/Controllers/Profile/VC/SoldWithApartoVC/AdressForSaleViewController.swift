//
//  AdressForSaleViewController.swift
//  Aparto
//
//  Created by Mac user on 15/09/21.
//

import UIKit

class AdressForSaleViewController: UIViewController {

    @IBOutlet weak var countryNameView: CustomView! {
        didSet {
            countryNameView.topTitle = "Город и улица"
            countryNameView.mainTitle = "OOO Golden Bridge"
        }
    }
    
    @IBOutlet weak var quaerterNameView: CustomView! {
        didSet {
            quaerterNameView.topTitle = "Квартал "
            quaerterNameView.mainTitle = "5"
        }
    }
    
    @IBOutlet weak var houseNameView: CustomView! {
        didSet {
            houseNameView.topTitle = "Дом"
            houseNameView.mainTitle = "66"
        }
    }
    @IBOutlet weak var entranceNameView: CustomView! {
        didSet {
            entranceNameView.topTitle = "Подъезд"
            entranceNameView.mainTitle = "5"
        }
    }
    @IBOutlet weak var apartmentNameView: CustomView! {
        didSet {
            apartmentNameView.topTitle = "Квартира"
            apartmentNameView.mainTitle = "66"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        setDetails()
   }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Продать с Aparto"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        setBackroundImageForNavigation()
    }
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .black
    }

}
