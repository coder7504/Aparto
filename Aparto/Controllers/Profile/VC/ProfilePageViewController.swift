//
//  ProfilePageViewController.swift
//  Aparto
//
//  Created by Mac user on 12/09/21.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    
    @IBOutlet weak var balancContainerView: UIView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        setDetails()
        setShadow()
        print("🐹 ", (Cache.getUserName() ?? "") + " " + (Cache.getUserSurname() ?? ""))
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Личный кабинет"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fullNameLabel.text = (Cache.getUserName() ?? "") + " " + (Cache.getUserSurname() ?? "")
    }
    
    func setBackroundImageForNavigation(){
        navigationItem.backButtonTitle = ""
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
    
    func setShadow() {
        balancContainerView.layer.shadowColor = #colorLiteral(red: 0.8928433657, green: 0.8945922256, blue: 0.8900581002, alpha: 1)
        balancContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        balancContainerView.layer.shadowRadius = 4
        balancContainerView.layer.shadowOpacity = 1
    }
    
    
    @IBAction func myProfileButtonTApped(_ sender: Any) {
        let vc = MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileNotificationButtonTapped(_ sender: Any) {
        let vc = MyProfileNotificationsViewController(nibName: "MyProfileNotificationsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileMailButtonTapped(_ sender: Any) {
        let vc = MyProfileMailViewController(nibName: "MyProfileMailViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func myProfileFavoriteButtonTapped(_ sender: Any) {
        let vc = MyProfileFavoriteViewController(nibName: "MyProfileFavoriteViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func myProfilePriceChangesButtonTapped(_ sender: Any) {
        let vc = MyProfileFavoriteViewController(nibName: "MyProfileFavoriteViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileMatchingButtonTapped(_ sender: Any) {
        let vc = MyProfileMatchingViewController(nibName: "MyProfileMatchingViewController", bundle: nil)
        vc.nesessaryTitles(navTitle: "Сохраненные Matching", tableTitle: "Название matching")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func myProfileFindMeButtonTapped(_ sender: Any) {
        let vc = MyProfileMatchingViewController(nibName: "MyProfileMatchingViewController", bundle: nil)
        vc.nesessaryTitles(navTitle: "Найди меня", tableTitle: "Название найди меня")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileHistoryButtonTapped(_ sender: Any) {
        let vc = HistoryOfBalanceViewController(nibName: "HistoryOfBalanceViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileRefilButtonTapped(_ sender: Any) {
        let vc = MyProfilePaymentViewController(nibName: "MyProfilePaymentViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileSettingsButtonTapped(_ sender: Any) {
        let vc = MyProfileSettingsViewController(nibName: "MyProfileSettingsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myProfileMyAnnouncementsButtonTapped(_ sender: Any) {
        let vc = MyAnnouncementsViewController(nibName: "MyAnnouncementsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        
//        if Reachability.isConnectedToNetwork() {
//            API.deleteUser { (isDelete) in
//                guard let isDelete = isDelete else { return }
//                if isDelete {
//                    print("sign out")
//                } else {
//                    self.showWarningAlert(title: "Xatolik", message: "Ma'lumotlarni o'chirishda xatolik. Iltimos qaytadan urunib ko'ring.")
//                }
//            }
//        } else {
//            AlertNET.showAlert(title:Keys.a_internet, message: Keys.a_goOnline) { (_) in }
//        }
        
        
        let vc = ComplaintViewController(nibName: "ComplaintViewController", bundle: nil)
        vc.complainDelegate = self
        vc.isComplain = true
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func helpButtonTapped(_ sender: Any) {
        let vc = HelpOnTheSiteViewController(nibName: "HelpOnTheSiteViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func aboutUsButtonTapped(_ sender: Any) {
        let vc = AboutUsViewController(nibName: "AboutUsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func saleWithApartoButtonTapped(_ sender: Any) {
        let vc = NewBuildingAnnouncementViewController(nibName: "NewBuildingAnnouncementViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let vc = RegistrationPersonalAreaViewController(nibName: "RegistrationPersonalAreaViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ProfilePageViewController: PresentComplaintALert {
    func presentAlert() {
        Alert.showAlert(forState: .complaint, message: "Спасибо. \n Ваша жалоба принята и будет обработана.")
    }
}
