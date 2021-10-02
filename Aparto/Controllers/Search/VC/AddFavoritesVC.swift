//
//  AddFavoritesVC.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 14/09/21.
//

import UIKit

class AddFavoritesVC: UIViewController {

    
    fileprivate let btn: CustomBtn = {
        let btn = CustomBtn()
        btn.layer.cornerRadius = 0
        btn.titleLabel?.numberOfLines = 2
        btn.titleEdgeInsets.left = 5
        btn.titleEdgeInsets.top = 5
        btn.titleEdgeInsets.bottom = 5
        btn.titleEdgeInsets.right = 5
        btn.setTitle("Объявление добавлено в избранные", for: .normal)
        btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        btn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        btn.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    }
    

    @objc func btnTapped(_ sender: CustomBtn) {
        print("Bosildi")
    }

}
