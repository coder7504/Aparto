//
//  MyAnnouncementsViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyAnnouncementsViewController: UIViewController {
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var hideStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(MyAnnouncementsTableViewCell.nib(), forCellReuseIdentifier: MyAnnouncementsTableViewCell.identifire)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        dateView.layer.borderWidth = 2
        dateView.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Мои объявления"
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

extension MyAnnouncementsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ad pressed")
    }
    
}


// MARK: -- extension UITableViewDataSource

extension MyAnnouncementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyAnnouncementsTableViewCell.identifire, for: indexPath) as? MyAnnouncementsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    //    MARK: -- Scroll Direction
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            UIView.animate(withDuration: 0.3) {
                self.hideStackView.transform = .identity
                self.hideStackView.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.hideStackView.isHidden = true
                self.hideStackView.transform = CGAffineTransform(translationX: 0, y: -200)
            }
        }
    }
    
}

