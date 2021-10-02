//
//  ChooseRepairViewController.swift
//  Aparto
//
//  Created by Mac user on 15/09/21.
//

import UIKit

class ChooseRepairViewController: UIViewController {
    
    
    @IBOutlet weak var informationTableView: UITableView! {
        didSet {
            informationTableView.delegate = self
            informationTableView.dataSource = self
            informationTableView.tableFooterView = UIView()
            informationTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
            informationTableView.register(AlllInformationTableViewCell.nib(), forCellReuseIdentifier: AlllInformationTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heightForTableView: NSLayoutConstraint!
    
    var descrip: [String] = [
        "Вторичка",
        "Раздельный",
        "Без ремонта",
        "Кирпичный",
    ]
    
    var titleArray: [String] = [
        "Евро",
        "Без ремонат",
        "Без ремонат",
        "Евро"
    ]
    
    let deviceHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerView()
        if deviceHeight < 700 {
            heightForTableView.constant = min(CGFloat(50*titleArray.count)+140, 400)
        } else if deviceHeight < 800 {
            heightForTableView.constant = min(CGFloat(50*titleArray.count)+140, 600)
        } else if deviceHeight < 950 {
            heightForTableView.constant = min(CGFloat(50*titleArray.count)+140,750)
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
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}





// MARK: -- extension UITableViewDelegate

extension ChooseRepairViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AlllInformationTableViewCell
        cell.titleLabel.textColor = .main
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


// MARK: -- extension UITableViewDataSource

extension ChooseRepairViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlllInformationTableViewCell.identifire, for: indexPath) as? AlllInformationTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(title: titleArray[indexPath.row], desc: descrip[indexPath.row])
        cell.descriptionLabel.isHidden = true
        return cell
    }
    
    
}
