//
//  FilterVC.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 11/09/21.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.clipsToBounds = true
            backView.layer.cornerRadius = 12
        }
    }
    
    
    @IBOutlet weak var movingView: UIView!
    
    
    @IBOutlet weak var searchView: CustomView! {
        didSet {
            searchView.topTitle = "Я ищу..."
            searchView.mainTitle = "Квартиру"
            searchView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    @IBOutlet weak var forView: CustomView! {
        didSet {
            forView.topTitle = "Для..."
            forView.mainTitle = "Аренды"
            forView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    @IBOutlet weak var additionalView: CustomView! {
        didSet {
            additionalView.topTitle = "Дополнительные удобства"
            additionalView.mainTitle = "Выбрано 5"
            additionalView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    
    @IBOutlet weak var materialView: CustomView! {
        didSet {
            materialView.topTitle = "Материал стен"
            materialView.mainTitle = "Кирпич, Бетон"
            materialView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    @IBOutlet weak var repairView: CustomView! {
        didSet {
            repairView.topTitle = "Ремонт"
            repairView.mainTitle = "Выберите пункт"
            repairView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    @IBOutlet weak var yearHomeView: CustomView! {
        didSet {
            yearHomeView.topTitle = "Год постройки здания"
            yearHomeView.mainTitle = "2005"
            yearHomeView.rightImage = UIImage(named: "arrow-right")
        }
    }
    
    
    @IBOutlet var numRooms: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    
    @IBAction func xPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
    }
    
    
    
    @IBAction func countRoomsPressed(_ sender: UIButton) {
        for btn in numRooms {
            if btn.tag == sender.tag {
                btn.backgroundColor = .main
                btn.setTitleColor(.white, for: .normal)
            }else {
                btn.backgroundColor = .hovered
                btn.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    
    
    @IBAction func applyPressed(_ sender: Any) {
    }
}

