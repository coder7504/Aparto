//
//  ProductPagePhoneViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit

class ProductPagePhoneViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       hideContainerView()
    }
    
    func hideContainerView() {
        UIView.animate(withDuration: 0.00001) { [self] in
            
            containerView.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.4) { [self] in
            containerView.transform = .identity
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCornerRadius()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    

    func setCornerRadius() {
        containerView.layer.cornerRadius = 16
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
}
