//
//  SearchVC.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 11/09/21.
//

import UIKit

class SearchVC: UIViewController {
    
    
    @IBOutlet weak var searchController: UISearchBar! {
        didSet {
            searchController.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationController()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.register(SearchAdTableViewCell.nib(), forCellReuseIdentifier: SearchAdTableViewCell.identifire)
        tableView.register(SearchPaymentTableViewCell.nib(), forCellReuseIdentifier: SearchPaymentTableViewCell.identifier)
        tableView.register(BannerTVC.nib(), forCellReuseIdentifier: BannerTVC.identifier)
        
    }
    
    
    

    
    
    fileprivate func initNavigationController() {
        navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    
    
    @IBAction func filterBtnPressed(_ sender: Any) {
        
    }
    
    
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTVC.identifier, for: indexPath) as? BannerTVC else { return UITableViewCell()}
            return cell
        } else if indexPath.row == 9 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchPaymentTableViewCell.identifier, for: indexPath) as? SearchPaymentTableViewCell else { return UITableViewCell()}
            cell.setShadowForButton()
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchAdTableViewCell.identifire, for: indexPath) as? SearchAdTableViewCell else { return UITableViewCell()}
            cell.delegete = self
            return cell
        }
    }
    
    
    
}



extension SearchVC: MoreAboutAnnouncement {
    func moreTapped() {
        let vc = MoreViewController(nibName: "MoreViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
}


extension SearchVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        filterBtn.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        filterBtn.isHidden = false
        view.endEditing(true)
    }
}
