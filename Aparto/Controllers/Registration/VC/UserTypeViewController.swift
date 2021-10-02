//
//  UserTypeViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/27/21.
//

import UIKit

protocol UserTypeDelegate {
    func userType(type: String, id: String)
}

class UserTypeViewController: UIViewController {

    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(ComplaintTableViewCell.nib(), forCellReuseIdentifier: ComplaintTableViewCell.identifire)
        }
    }
    @IBOutlet weak var containerView: UIView!
    
    var delegate: UserTypeDelegate!
    var userTyp: [UserType] = []

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
        Loader.start()
        getUserType()
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
   

   @IBAction func dismissButtonTapped(_ sender: Any) {
       UIView.animate(withDuration: 0.4) {
           self.view.alpha = 0
           self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
       } completion: { (_) in
           self.dismiss(animated: true, completion: nil)
       }
   }

    func getUserType() {
        let screenHeight = UIScreen.main.bounds.height
        API.getUserType { [self] (types) in
            Loader.stop()
            guard let types = types else { return }
            self.userTyp = types
             tableView.reloadData()
            tableViewHeight.constant = CGFloat( min(CGFloat(types.count*50), 0.8*screenHeight))
        }
    }

}





// MARK: -- extension UITableViewDelegate

extension UserTypeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let cell = tableView.cellForRow(at: indexPath) as! ComplaintTableViewCell
        cell.colorView.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
        delegate.userType(type: translateTitle(title: userTyp[indexPath.row].name), id: userTyp[indexPath.row].getID())
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}


// MARK: -- extension UITableViewDataSource

extension UserTypeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTyp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComplaintTableViewCell.identifire, for: indexPath) as? ComplaintTableViewCell else {
            return UITableViewCell()
        }
        if !userTyp.isEmpty {
            cell.updateCell(title: translateTitle(title: userTyp[indexPath.row].name), bacColor: .clear)
            cell.setBorder()
        }
        return cell
    }
    
}



