//
//  MyProfileFavoriteViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileFavoriteViewController: UIViewController {
    
    @IBOutlet weak var adTableView: UITableView! {
        didSet {
            adTableView.delegate = self
            adTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
            adTableView.dataSource = self
            adTableView.tableFooterView = UIView()
            adTableView.separatorStyle = .none
            adTableView.register(ProfileAdTableViewCell.nib(), forCellReuseIdentifier: ProfileAdTableViewCell.identifire)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        navigationItem.title = "Избранные"
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

extension MyProfileFavoriteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ad pressed")
    }
    
}


// MARK: -- extension UITableViewDataSource

extension MyProfileFavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAdTableViewCell.identifire, for: indexPath) as? ProfileAdTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}

