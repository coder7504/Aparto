//
//  AllConvenienceViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit

class AllConvenienceViewController: UIViewController {
    
    @IBOutlet weak var convenienceTableView: UITableView! {
        didSet {
            convenienceTableView.delegate = self
            convenienceTableView.dataSource = self
            convenienceTableView.tableFooterView = UIView()
            convenienceTableView.separatorStyle = .none
            convenienceTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
            convenienceTableView.register(AllConvenienceTableViewCell.nib(), forCellReuseIdentifier: AllConvenienceTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var heightForTableView: NSLayoutConstraint!
    
    var titleArray: [String] = [
        "Быстрый лифт",
        "Метро рядом",
        "Спортивная площадка",
        "Балкон",
        "Быстрый лифт",
        "Метро рядом",
        "Спортивная площадка",
        "Спортивная площадка"
    ]
    
    
    let deviceHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerView()
        if deviceHeight < 700 {
            heightForTableView.constant = min(CGFloat(80*titleArray.count), 400)
        } else if deviceHeight < 800 {
            heightForTableView.constant = min(CGFloat(80*titleArray.count), 600)
        } else if deviceHeight < 950 {
            heightForTableView.constant = min(CGFloat(80*titleArray.count),750)
        }

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
    
    @IBAction func showPhoneNumberButtonTapped(_ sender: Any) {
        let vc = ProductPagePhoneViewController(nibName: "ProductPagePhoneViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    

}





// MARK: -- extension UITableViewDelegate

extension AllConvenienceViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("AllConvenienceViewController pressed")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


// MARK: -- extension UITableViewDataSource

extension AllConvenienceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllConvenienceTableViewCell.identifire, for: indexPath) as? AllConvenienceTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(title: titleArray[indexPath.row])
        return cell
    }
    
    
}
