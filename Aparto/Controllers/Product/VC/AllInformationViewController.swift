//
//  AllInformationViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit

class AllInformationViewController: UIViewController {
    
    @IBOutlet weak var informationTableView: UITableView! {
        didSet {
            informationTableView.delegate = self
            informationTableView.dataSource = self
            informationTableView.tableFooterView = UIView()
            informationTableView.separatorStyle = .none
            informationTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
            informationTableView.register(AlllInformationTableViewCell.nib(), forCellReuseIdentifier: AlllInformationTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heightForTableView: NSLayoutConstraint!

    var titleArray: [String] = [
        "Тип жилья",
        "Общая площадь",
        "Жилая площадь",
        "Санузел",
        "Ремонт",
        "Тип дома",
        "Год постройки",
        "Лифт",
        "Количество комнат",
        "Балкон",
        "Тип жилья",
        "Общая площадь",
        "Жилая площадь",
        "Санузел",
        "Ремонт",
        "Тип дома"
    ]
    
    var descrip: [String] = [
        "Вторичка",
        "112 м2",
        "221 м2",
        "Раздельный",
        "Без ремонта",
        "Кирпичный",
        "1998",
        "Есть",
        "5",
        "Есть",
        "Вторичка",
        "112 м2",
        "221 м2",
        "Раздельный",
        "Без ремонта",
        "Кирпичный",
    ]
    
    let deviceHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerView()
        if deviceHeight < 700 {
            heightForTableView.constant = min(CGFloat(34*titleArray.count), 400)
        } else if deviceHeight < 800 {
            heightForTableView.constant = min(CGFloat(34*titleArray.count), 600)
        } else if deviceHeight < 950 {
            heightForTableView.constant = min(CGFloat(34*titleArray.count),750)
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

extension AllInformationViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("AllInformationViewController pressed")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}


// MARK: -- extension UITableViewDataSource

extension AllInformationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlllInformationTableViewCell.identifire, for: indexPath) as? AlllInformationTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(title: titleArray[indexPath.row], desc: descrip[indexPath.row])
        return cell
    }
    
    
}
