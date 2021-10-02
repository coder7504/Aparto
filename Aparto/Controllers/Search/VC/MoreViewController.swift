//
//  MoreViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/27/21.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideContainerView()
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
    
    
    func hideContainerView() {
        UIView.animate(withDuration: 0.00001) { [self] in
            containerView.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
        }
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
   
    @IBAction func complainButtonTapped(_ sender: Any) {
        let vc = ComplaintViewController(nibName: "ComplaintViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.complainDelegate = self
        vc.isComplain = true
        present(vc, animated: false, completion: nil)
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



extension MoreViewController: PresentComplaintALert {
    func presentAlert() {
        Alert.showAlert(forState: .complaint, message: "Спасибо. \n Ваша жалоба принята и будет обработана.")
    }
}
