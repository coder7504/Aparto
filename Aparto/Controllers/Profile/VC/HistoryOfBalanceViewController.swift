//
//  HistoryOfBalanceViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class HistoryOfBalanceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(HistoryOfBalanceTableViewCell.nib(), forCellReuseIdentifier: HistoryOfBalanceTableViewCell.identifire)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "История баланса"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        
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

extension HistoryOfBalanceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ad pressed")
    }
    
}


// MARK: -- extension UITableViewDataSource

extension HistoryOfBalanceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryOfBalanceTableViewCell.identifire, for: indexPath) as? HistoryOfBalanceTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row%2 == 1 {
            cell.moneyLabel.textColor = UIColor.main
        }
        return cell
    }
    
}

