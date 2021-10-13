//
//  SellBannerViewController.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class SellBannerViewController: UIViewController {

    @IBOutlet weak var sellButtonOutlet: UIButton!
    @IBOutlet weak var containerViewOulet: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerView()
        setCornerRadius()
        
    }
    
    
    func hideContainerView() {
        UIView.animate(withDuration: 0.00001) { [self] in
            
            containerViewOulet.transform = CGAffineTransform(translationX: 0, y: containerViewOulet.frame.height)
        }
    }
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       UIView.animate(withDuration: 0.4) { [self] in
        containerViewOulet.transform = .identity
           self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
       }
   }
    
    
    fileprivate
    func setCornerRadius() {
        sellButtonOutlet.layer.cornerRadius = 12
        containerViewOulet.layer.cornerRadius = 16
        containerViewOulet.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerViewOulet.transform = CGAffineTransform(translationX: 0, y: self.containerViewOulet.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerViewOulet.transform = CGAffineTransform(translationX: 0, y: self.containerViewOulet.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
    }
    

}
