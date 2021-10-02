//
//  HelpOnTheSiteViewController.swift
//  Aparto
//
//  Created by Mac user on 14/09/21.
//

import UIKit

class HelpOnTheSiteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(HelpOnTheSiteTableViewCell.nib(), forCellReuseIdentifier: HelpOnTheSiteTableViewCell.identifire)
        }
    }
    
    var dataFAQ: [HelpFromUs] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        Loader.start()
        getAllData()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Помощь на сайте"
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
    
    func getAllData() {
        if Reachability.isConnectedToNetwork() {
            API.getFAQ { [self] (help) in
                Loader.stop()
                if let helpData = help {
                    dataFAQ = helpData
                    tableView.reloadData()
                } else {
                    showErrorAlert(title: "Xatolik", message: "Bog'lanishda xatolik ro'y berdi. Iltimos qayta urinib ko'ring")
                }
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
  
    
}






// MARK: -- extension UITableViewDelegate

extension HelpOnTheSiteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataFAQ[indexPath.row].isCollaps = !dataFAQ[indexPath.row].isCollaps
        tableView.reloadSections(IndexSet(integer: .zero), with: .fade)
    }
    
}


// MARK: -- extension UITableViewDataSource

extension HelpOnTheSiteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFAQ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HelpOnTheSiteTableViewCell.identifire, for: indexPath) as? HelpOnTheSiteTableViewCell else {
            return UITableViewCell()
        }
        cell.descLabel.isHidden = !dataFAQ[indexPath.row].isCollaps
        cell.imageViewOutlet.image = !dataFAQ[indexPath.row].isCollaps ? UIImage(named: "up") : UIImage(named: "down")
        cell.setShadow(tit: translateTitle(title: dataFAQ[indexPath.row].name), desc: translateTitle(title: dataFAQ[indexPath.row].description))
        cell.selectionStyle = .none
        return cell
    }
    
}

