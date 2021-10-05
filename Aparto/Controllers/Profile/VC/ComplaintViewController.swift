//
//  ComplaintViewController.swift
//  Aparto
//
//  Created by Mac user on 14/09/21.
//

import UIKit

protocol PresentComplaintALert {
    func presentAlert()
}

protocol CurrentCurrency {
    func currency(curreny: Currency)
}

class ComplaintViewController: UIViewController {
    
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
    
    var categoryName: [ComplainCategory] = []
    var allCurrency: [Currency] = []
    var complainDelegate: PresentComplaintALert!
    var currencyDelegate: CurrentCurrency!
    var isCurrency: Bool = false
    var isComplain: Bool = false
    
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
        if isComplain {
            getAllComplain()
        } else if isCurrency {
            getAllCurrency()
        }
   }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isCurrency = false
        isComplain = false
    }
    
    
    func hideContainerView() {
        UIView.animate(withDuration: 0.00001) { [self] in
            containerView.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
        }
    }
   
    func getAllComplain() {
        let screenHeight = UIScreen.main.bounds.height
        API.getCopmlainCategory { [self] (category) in
            Loader.stop()
            categoryName = category!
            tableView.reloadData()
            tableViewHeight.constant = CGFloat( min(CGFloat(category!.count*50), 0.8*screenHeight))
        }
    }
    
    func getAllCurrency() {
        let screenHeight = UIScreen.main.bounds.height
        API.getAllCurrency { [self] (curreny) in
            Loader.stop()
            allCurrency = curreny!
            tableView.reloadData()
            tableViewHeight.constant = CGFloat( min(CGFloat(curreny!.count*50), 0.8*screenHeight))
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


}





// MARK: -- extension UITableViewDelegate

extension ComplaintViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let cell = tableView.cellForRow(at: indexPath) as! ComplaintTableViewCell
        cell.colorView.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
        
//      MARK: --      announcementId   kk   ??????
        if isComplain {
            Loader.start()
            API.createComplain(userId: Cache.getUserId()!, announcementId: "61220cd3a1c0dbaceeb709d4", complainCategoryId: categoryName[indexPath.row]._id) { [self] (isSave) in
                Loader.stop()
                guard let isSave = isSave else { return }
                if isSave {
                    complainDelegate.presentAlert()
                    dismiss(animated: false, completion: nil)
                } else {
                    showWarningAlert(title: "Xatolik", message: "Shiyatingiz qabul qilinmadi qayta urinib kuring")
                }
            }
        } else if isCurrency {
            currencyDelegate.currency(curreny: allCurrency[indexPath.row])
            dismiss(animated: false, completion: nil)
        }
        
        
        
    }
    
}


// MARK: -- extension UITableViewDataSource

extension ComplaintViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isComplain {
            return categoryName.count
        } else {
            return allCurrency.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComplaintTableViewCell.identifire, for: indexPath) as? ComplaintTableViewCell else {
            return UITableViewCell()
        }
        if !categoryName.isEmpty && isComplain {
            cell.updateCell(title: translateTitle(title: categoryName[indexPath.row].name), bacColor: .clear)
            cell.setBorder()
        } else if !allCurrency.isEmpty && isCurrency {
            cell.updateCell(title: allCurrency[indexPath.row].name, bacColor: .clear)
            cell.setBorder()
        }
        return cell
    }
    
}



