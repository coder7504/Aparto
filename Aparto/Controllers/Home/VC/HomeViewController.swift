//
//  HomeViewController.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sellWithApartoContainerView: UIView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
            categoryCollectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var residentalComplexCollectionView: UICollectionView! {
        didSet {
            residentalComplexCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            residentalComplexCollectionView.delegate = self
            residentalComplexCollectionView.dataSource = self
            residentalComplexCollectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var seeAllLCDsButtonOutlet: UIButton!
    
    @IBOutlet weak var categoryRentCollectionView: UICollectionView! {
        didSet {
            categoryRentCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            categoryRentCollectionView.delegate = self
            categoryRentCollectionView.dataSource = self
            categoryRentCollectionView.register(RentCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: RentCategoryCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var rentPhotoCollectionView: UICollectionView! {
        didSet {
            rentPhotoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            rentPhotoCollectionView.delegate = self
            rentPhotoCollectionView.dataSource = self
            rentPhotoCollectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var adCollectionView: UICollectionView! {
        didSet {
            adCollectionView.delegate = self
            adCollectionView.dataSource = self
            adCollectionView.register(AdCollectionViewCell.nib(), forCellWithReuseIdentifier: AdCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var companiesCollectionView: UICollectionView! {
        didSet {
            companiesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            companiesCollectionView.delegate = self
            companiesCollectionView.dataSource = self
            companiesCollectionView.register(CompaniesCollectionViewCell.nib(), forCellWithReuseIdentifier: CompaniesCollectionViewCell.identifire)
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
    
    @IBOutlet weak var newsCollectionView: UICollectionView! {
        didSet {
            newsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            newsCollectionView.delegate = self
            newsCollectionView.dataSource = self
            newsCollectionView.register( NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var residentalComplexLabel: UILabel!
    
    @IBOutlet weak var rentTitleLabel: UILabel!
    
    @IBOutlet weak var builderTitleLabel: UILabel!
    
    @IBOutlet weak var housingIssuseTitleLabel: UILabel!
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var scrollAdButtonOutlet: [UIButton]! {
        didSet {
            scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
            for i in scrollAdButtonOutlet {
                i.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                i.layer.shadowRadius = 2
                i.layer.shadowOpacity = 0.8
                i.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        }
    }
    
    var adPhotoArr: [String] = ["sd","sd","cv","sd"]
    var newsData: [News] = []
    var newsCategoryData: [NewsCategory] = []
    var dataLimit = 4
    var newsIsNextPage: Bool = true
    var sellTypeData: [SellType] = []
    var carusellAdver: [RandomAdvertisement] = []
    var sellTypePhoto: [String] = ["buy","rent"]
    var developrsData: [Company] = []
    var serviceData: [Service] = []
    var bottomAnnouncementData: [Announcement] = []
    var topAnnouncementData: [Announcement] = []
    var rentData: [ObjectPermissionType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        setDetails()
        setCornerRadius()
        setLabelText()
        print("token 🐱 = ",Cache.getToken())
        Loader.start()
        //        getRentCategoryData()
        getNews(limit: dataLimit, skip: 0)
        getDevelopers(limit: dataLimit, skill: 0)
        getSellTypeData()
        getRandomAdvertisenment()
        //        getAllAnnouncement()
        getService()
        getBottomAnnouncement(limit: dataLimit, skip: 0)
        getTopRecommendedAnnouncement(limit: dataLimit, skip: 0)
        getObjectPermissionType()
        print("user tel = ", Cache.getUserPhoneNumber())
        print("user pass = ", Cache.getUserPassword())
    }
    
    func setDetails() {
        navigationItem.title = "Главная"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        setRightButtonForNav()
        removeButtomLineNavigation()
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func setRightButtonForNav() {
        navigationItem.backButtonTitle = ""
        let bell = UIBarButtonItem(image: UIImage(named: "bell"), style: .done, target: self, action: #selector(bellTapped))
        navigationItem.rightBarButtonItem = bell
    }
    
    @objc func bellTapped() {
        print("Bell")
    }
    
    func setCornerRadius() {
        seeAllLCDsButtonOutlet.layer.cornerRadius = 12
        sellWithApartoContainerView.layer.cornerRadius = 20
    }
    
    func setLabelText() {
        residentalComplexLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
        rentTitleLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
        builderTitleLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
        housingIssuseTitleLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
        newsTitleLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
    }
    
    
    @IBAction func scrollAdButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) { [self] in
            if sender.tag == 0 {
                adCollectionView.contentOffset.x = 0
                scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
                scrollAdButtonOutlet[1].transform = .identity
            } else {
                print("keldi")
                adCollectionView.contentOffset.x = adCollectionView.contentSize.width -  adCollectionView.frame.width
                scrollAdButtonOutlet[1].transform = CGAffineTransform(translationX: 100, y: 0)
                scrollAdButtonOutlet[0].transform = .identity
            }
        }
    }
    
    
    @IBAction func seeAllNewsButtonTapped(_ sender: Any) {
        let vc = AllNewsViewController(nibName: "AllNewsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sellWithApartoButtonTapped(_ sender: Any) {
        let vc = SellBannerViewController(nibName: "SellBannerViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    
}





//  MARK: -- extension : UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            if indexPath.row == 0 {
                let vc = NewBuildingAnnouncementViewController(nibName: "NewBuildingAnnouncementViewController", bundle: nil)
                navigationItem.backButtonTitle = ""
                navigationItem.backBarButtonItem?.tintColor = .black
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = MovingAssistanceViewController(nibName: "MovingAssistanceViewController", bundle: nil)
                navigationItem.backButtonTitle = ""
                navigationItem.backBarButtonItem?.tintColor = .black
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if collectionView == categoryRentCollectionView {
            
            for i in 0...rentData.count-1 {
                rentData[i].isSelected = false
            }
            categoryRentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            //            print("keldi")
            //            print(" frame = ", categoryCollectionView.cellForItem(at: indexPath)?.frame)
            rentData[indexPath.row].isSelected = true
            categoryRentCollectionView.reloadData()
        } else if collectionView == newsCollectionView {
            let vc = SelectNewsViewController(nibName: "SelectNewsViewController", bundle: nil)
            for i in 0...newsData.count-1 {
                if i != indexPath.row {
                    vc.newsDatas.append(newsData[i])
                }
            }
            vc.newsData = self.newsData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        } else if collectionView == adCollectionView {
            
            let vc = PhotoBannerViewController(nibName: "PhotoBannerViewController", bundle: nil)
            vc.modalPresentationStyle = .overFullScreen
            if !carusellAdver.isEmpty {
                vc.ad = carusellAdver[indexPath.row]
            }
            present(vc, animated: false, completion: nil)
            
        }  else if collectionView == companiesCollectionView {
            
            let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
            if !developrsData.isEmpty {
                vc.selectId = developrsData[indexPath.row]._id
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else if collectionView == housingIssuesCollectionView {
            
            let vc = MovingAssistanceViewController(nibName: "MovingAssistanceViewController", bundle: nil)
            if !developrsData.isEmpty {
                vc.selectServise = serviceData[indexPath.row]
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else if collectionView == rentPhotoCollectionView {
            
            let vc = PruductViewController(nibName: "PruductViewController", bundle: nil)
            if !bottomAnnouncementData.isEmpty {
                vc.data = bottomAnnouncementData[indexPath.row]
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else if collectionView == residentalComplexCollectionView {
            
            let vc = PruductViewController(nibName: "PruductViewController", bundle: nil)
            if !topAnnouncementData.isEmpty {
                vc.data = topAnnouncementData[indexPath.row]
            }
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: (self.categoryCollectionView.frame.width-16)/2.3, height: self.categoryCollectionView.frame.height)
        } else if collectionView == categoryRentCollectionView {
            return CGSize(width: translateTitle(title: rentData[indexPath.row].name).widthOfString(usingFont: .systemFont(ofSize: 16, weight: .semibold))+40, height: 35)
        } else if collectionView == residentalComplexCollectionView {
            return CGSize(width: self.residentalComplexCollectionView.frame.width-70, height: self.residentalComplexCollectionView.frame.height)
        } else if collectionView == adCollectionView {
            return CGSize(width: self.adCollectionView.frame.width, height: self.adCollectionView.frame.height)
        }  else if collectionView == companiesCollectionView {
            return CGSize(width: self.companiesCollectionView.frame.width/2.5, height: self.companiesCollectionView.frame.height)
        }  else if collectionView == newsCollectionView {
            return CGSize(width: self.newsCollectionView.frame.width/1.2, height: self.newsCollectionView.frame.height)
        }  else if collectionView == housingIssuesCollectionView {
            return CGSize(width: self.housingIssuesCollectionView.frame.width/1.5, height: self.housingIssuesCollectionView.frame.height)
        } else if collectionView == rentPhotoCollectionView {
            return CGSize(width: self.rentPhotoCollectionView.frame.width-70, height: self.rentPhotoCollectionView.frame.height)
        }
        return CGSize(width: self.rentPhotoCollectionView.frame.width-70, height: self.rentPhotoCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == adCollectionView {
            return !carusellAdver.isEmpty ? carusellAdver.count : 2
        } else if collectionView == newsCollectionView {
            return newsData.count
        } else if collectionView == categoryCollectionView {
            return sellTypeData.count+1
        }  else if collectionView == companiesCollectionView {
            return developrsData.count
        } else if collectionView == housingIssuesCollectionView {
            return serviceData.count
        } else if collectionView == residentalComplexCollectionView {
            return topAnnouncementData.count
        } else if collectionView == rentPhotoCollectionView {
            return bottomAnnouncementData.count
        }  else if collectionView == categoryRentCollectionView {
            return rentData.count
        }
        return rentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifire, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            if indexPath.row != 0 {
                if !sellTypeData.isEmpty{
                    cell.updateCell(name: translateTitle(title: sellTypeData[indexPath.row-1].name), desc: "Квартиру или дом", image: sellTypePhoto[indexPath.row-1])
                }
            }
            return cell
        } else if collectionView == residentalComplexCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResidentalComplexCollectionViewCell.identifire, for: indexPath) as? ResidentalComplexCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(isHide: true, top: 0, title: topAnnouncementData[indexPath.row].title, desc: topAnnouncementData [indexPath.row].description, price: Double(topAnnouncementData[indexPath.row].price.amount), image: topAnnouncementData[indexPath.row].images.first ?? "", _id: "")
            return cell
        } else if collectionView == rentPhotoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResidentalComplexCollectionViewCell.identifire, for: indexPath) as? ResidentalComplexCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(isHide: true, top: 0, title: bottomAnnouncementData[indexPath.row].title, desc: bottomAnnouncementData[indexPath.row].description, price: Double(bottomAnnouncementData[indexPath.row].price.amount), image: bottomAnnouncementData[indexPath.row].images.first ?? "", _id: "")
            return cell
            
        }  else if collectionView == adCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifire, for: indexPath) as? AdCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageViewOutlet.layer.cornerRadius = 8
            if carusellAdver.isEmpty {
                cell.imageViewOutlet.image = UIImage(named: "ad")
            } else {
                cell.imageViewOutlet.sd_setImage(with: URL(string: API.baseUrl + "/" + carusellAdver[indexPath.row].image), placeholderImage: UIImage(named: "ad"))
            }
            return cell
        }  else if collectionView == companiesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompaniesCollectionViewCell.identifire, for: indexPath) as? CompaniesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setCell(title: developrsData[indexPath.row].firstName+"\n"+developrsData[indexPath.row].lastName, image: developrsData[indexPath.row].image)
            return cell
        }  else if collectionView == housingIssuesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HousingIssuesCollectionViewCell.identifire, for: indexPath) as? HousingIssuesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(image: serviceData[indexPath.row].image, title: serviceData[indexPath.row].serviceType, desc: serviceData[indexPath.row].title)
            return cell
        }  else if collectionView == newsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifire, for: indexPath) as? NewsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(title: newsData[indexPath.row].title , category: translateTitle(title: newsData[indexPath.row].newsCategory.name), isTimeYes: false)
            return cell
        } else if collectionView == categoryRentCollectionView  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentCategoryCollectionViewCell.identifire, for: indexPath) as? RentCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.titleLabel.text = translateTitle(title: rentData[indexPath.row].name)
            cell.titleLabel.layer.cornerRadius = 8
            if rentData[indexPath.row].isSelected {
                cell.titleLabel.backgroundColor = UIColor.main
                cell.titleLabel.textColor = .white
            } else {
                cell.titleLabel.backgroundColor = UIColor.hovered
                cell.titleLabel.textColor = .black
            }
            cell.titleLabel.clipsToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    //    MARK: -- Pagination
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == newsCollectionView {
            if indexPath.item % dataLimit == dataLimit-1 && (indexPath.item+1 == newsData.count) {
                if (Cache.getNewsLength() ?? 0) != indexPath.row+1 {
                    self.getNews(limit: dataLimit, skip: indexPath.item+1)
                }
            }
        } else if collectionView == rentPhotoCollectionView {
            if indexPath.item % dataLimit == dataLimit-1 && (indexPath.item+1 == bottomAnnouncementData.count) {
                if (Cache.getBottomAnnouncementLength() ?? 0) != indexPath.row+1 {
                    self.getBottomAnnouncement(limit: dataLimit, skip: indexPath.item+1)
                }
            }
        }  else if collectionView == residentalComplexCollectionView {
            if indexPath.item % dataLimit == dataLimit-1 && (indexPath.item+1 == topAnnouncementData.count) {
                if (Cache.getTopRecommendedAnnouncementLength() ?? 0) != indexPath.row+1 {
                    self.getTopRecommendedAnnouncement(limit: dataLimit, skip: indexPath.item+1)
                }
            }
        }
        
    }
    
}


extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView == adCollectionView {
            UIView.animate(withDuration: 0.3) {
                self.scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
                self.scrollAdButtonOutlet[1].transform = CGAffineTransform(translationX: 100, y: 0)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        configureEndHelperButtons(with: scrollView)
    }
    
    fileprivate
    func configureEndHelperButtons(with scrollView: UIScrollView) {
        ///scrollView identification
        if scrollView == adCollectionView {
            let offsetX = adCollectionView.contentOffset.x
            let contentWidth = adCollectionView.contentSize.width
            let contentEnd = offsetX + adCollectionView.frame.width
            
            UIView.animate(withDuration: 0.3) { [self] in
                if offsetX < 80 {
                    scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
                    scrollAdButtonOutlet[1].transform = .identity
                } else
                
                if contentEnd > contentWidth - 80 {
                    scrollAdButtonOutlet[1].transform = CGAffineTransform(translationX: 100, y: 0)
                    scrollAdButtonOutlet[0].transform = .identity
                } else {
                    scrollAdButtonOutlet[1].transform = .identity
                    scrollAdButtonOutlet[0].transform = .identity
                }
            }
            
        }
    }
}


extension HomeViewController {
    
    func getCategoryNews(id: String) -> Population {
        for i in 0...newsCategoryData.count-1 {
            if id == newsCategoryData[i]._id {
                return newsCategoryData[i].name
            }
        }
        return Population()
    }
    
}


//      MARK: -- API



extension HomeViewController {
    
    
    //    func getRentCategoryData() {
    //        if Reachability.isConnectedToNetwork() {
    //            API.getRentCategory { [self] (rentData) in
    //                Loader.stop()
    ////                categoryForRent = rentData!
    //                categoryRentCollectionView.reloadData()
    //            }
    //        } else {
    //            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
    //        }
    //    }
    
    
    func getNews(limit: Int, skip: Int) {
        if Reachability.isConnectedToNetwork() {
            API.getNews(limit: limit, skip: skip) { [self] (news) in
                if let new = news {
                    newsData.append(contentsOf: new)
                }
                newsCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
    
    
    func getSellTypeData() {
        if Reachability.isConnectedToNetwork() {
            API.getSellType { [self] (type) in
                //                Loader.stop()
                sellTypeData = type!
                categoryCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
    
    
    func getRandomAdvertisenment() {
        if Reachability.isConnectedToNetwork() {
            API.getRandomAdvertisement(addType: "carousel-card") { [self] (ad) in
                //                Loader.stop()
                carusellAdver = ad ?? []
                adCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
    
    
    //    func getAllAnnouncement() {
    //        if Reachability.isConnectedToNetwork() {
    //            API.getAllAnnouncement { [self] (announcement) in
    ////                Loader.stop()
    //                print("✅")
    //                print(announcement)
    ////                carusellAdver = ad ?? []
    ////                adCollectionView.reloadData()
    //            }
    //        } else {
    //            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
    //        }
    //    }
    
    
    func getDevelopers(limit: Int, skill: Int) {
        if Reachability.isConnectedToNetwork() {
            API.getAllcompanies(limit: limit, skill: skill) { [self] comp in
                guard let comp = comp else { return }
                developrsData = comp
                Loader.stop()
                companiesCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    
    
    func getService() {
        if Reachability.isConnectedToNetwork() {
            API.getService { [self] service in
                if let ser = service {
                    serviceData = ser
                    housingIssuesCollectionView.reloadData()
                }
            }
        }  else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    
    
    func getBottomAnnouncement(limit: Int, skip: Int) {
        if Reachability.isConnectedToNetwork() {
            API.getRandomBottomAnnouncement(limit: limit, skip: skip) { [self] bottom in
                if let ann = bottom {
                    bottomAnnouncementData.append(contentsOf: ann)
                    self.rentPhotoCollectionView.reloadData()
                }
            }
        }  else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    
    
    func getTopRecommendedAnnouncement(limit: Int, skip: Int) {
        if Reachability.isConnectedToNetwork() {
            API.getRandomTopAnnouncement(limit: limit, skip: skip) { [self] top in
                if let ann = top {
                    topAnnouncementData.append(contentsOf: ann)
                    self.residentalComplexCollectionView.reloadData()
                }
            }
        }  else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    
    
    func getObjectPermissionType() {
        if Reachability.isConnectedToNetwork() {
            API.getObjectPermissionType() { [self] type in
                if let typ = type {
                    rentData = typ
                    self.categoryRentCollectionView.reloadData()
                }
            }
        }  else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
        }
    }
    
    
}






