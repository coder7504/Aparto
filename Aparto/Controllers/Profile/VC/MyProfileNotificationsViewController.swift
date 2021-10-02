//
//  MyProfileNotificationsViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileNotificationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(MyProfileNotificationsTableViewCell.nib(), forCellReuseIdentifier: MyProfileNotificationsTableViewCell.identifire)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        tableView.isHidden = true
        
        setDetails()
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Уведомления"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    
}





// MARK: -- extension UITableViewDelegate

extension MyProfileNotificationsViewController: UITableViewDelegate {
    
}


// MARK: -- extension UITableViewDataSource

extension MyProfileNotificationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileNotificationsTableViewCell.identifire, for: indexPath) as? MyProfileNotificationsTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 2 || indexPath.row == 3 {
            cell.containerView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            cell.yellowRoundImage.isHidden = true
        }
        return cell
    }
    
    
}
