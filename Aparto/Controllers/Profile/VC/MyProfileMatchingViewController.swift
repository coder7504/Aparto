//
//  MyProfileMatchingViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileMatchingViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.register(MyProfileMatchingTableViewCell.nib(), forCellReuseIdentifier: MyProfileMatchingTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hideStackView: UIStackView!
    
    
    private var navigationTitle: String = ""
    private var tableViewTitle: String = ""
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.isHidden = true
        setDetails()
    }
    
    func setDetails() {
        titleLabel.text = navigationTitle
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    func nesessaryTitles(navTitle: String, tableTitle: String) {
        navigationTitle = navTitle
        tableViewTitle = tableTitle
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

extension MyProfileMatchingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ad pressed")
    }
    
}


// MARK: -- extension UITableViewDataSource

extension MyProfileMatchingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileMatchingTableViewCell.identifire, for: indexPath) as? MyProfileMatchingTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(title: tableViewTitle)
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

