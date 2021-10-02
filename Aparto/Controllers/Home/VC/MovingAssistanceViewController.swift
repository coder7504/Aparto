//
//  MovingAssistanceViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit

class MovingAssistanceViewController: UIViewController {

    
    @IBOutlet weak var cleaningApartmentTableView: UITableView! {
        didSet {
            cleaningApartmentTableView.delegate = self
            cleaningApartmentTableView.dataSource = self
            cleaningApartmentTableView.tableFooterView = UIView()
            cleaningApartmentTableView.separatorStyle = .none
            cleaningApartmentTableView.register(CleaningApartmentTableViewCell.nib(), forCellReuseIdentifier: CleaningApartmentTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var housingIssuesCollectionView: UICollectionView! {
        didSet {
            housingIssuesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            housingIssuesCollectionView.delegate = self
            housingIssuesCollectionView.dataSource = self
            housingIssuesCollectionView.register( HousingIssuesCollectionViewCell.nib(), forCellWithReuseIdentifier: HousingIssuesCollectionViewCell.identifire)
        }
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setDetails()
       }

    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = UIColor.black
           navigationItem.title = "Помощь с переездом"
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
    
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: -- extension UITableViewDelegate

extension MovingAssistanceViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 0, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Компании по чистке квартир"
            label.font = UIFont(name: "ProximaNova-Semibold", size: 18)
            label.textColor = .black
            
            headerView.addSubview(label)
            headerView.backgroundColor = .white
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
}


// MARK: -- extension UITableViewDataSource

extension MovingAssistanceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CleaningApartmentTableViewCell.identifire, for: indexPath) as? CleaningApartmentTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell()
        return cell
    }
    
    
}





//  MARK: -- extension : UICollectionViewDelegate

extension MovingAssistanceViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension MovingAssistanceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.housingIssuesCollectionView.frame.width/1.43, height: self.housingIssuesCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension MovingAssistanceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HousingIssuesCollectionViewCell.identifire, for: indexPath) as? HousingIssuesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell()
            return cell
    }
    
    
}
