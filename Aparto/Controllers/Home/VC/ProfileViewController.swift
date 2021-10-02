//
//  ProfileViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/11/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    
    @IBOutlet weak var profileImageViewOutlet: UIImageView!
    
    @IBOutlet weak var adTableView: UITableView! {
        didSet {
            adTableView.delegate = self
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCornerRadius()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
           navigationItem.title = "Профиль пользователя"
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
    
    func setCornerRadius() {
        profileImageViewOutlet.layer.cornerRadius = profileImageViewOutlet.frame.height/2
    }
    
    
    @IBAction func showPhoneButtonTapped(_ sender: UIButton) {
        let vc = PruductViewController(nibName: "PruductViewController", bundle: nil)
        navigationItem.backButtonTitle  = ""
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}





// MARK: -- extension UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ad pressed")
    }
    
}


// MARK: -- extension UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
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
