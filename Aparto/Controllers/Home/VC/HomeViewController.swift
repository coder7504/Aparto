//
//  HomeViewController.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

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
    
    @IBOutlet weak var saleCollectionView: UICollectionView! {
        didSet {
            saleCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            saleCollectionView.delegate = self
            saleCollectionView.dataSource = self
            saleCollectionView.register(RentCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: RentCategoryCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var salePhotoCollectionView: UICollectionView! {
        didSet {
            salePhotoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            salePhotoCollectionView.delegate = self
            salePhotoCollectionView.dataSource = self
            salePhotoCollectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
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
    
    @IBOutlet weak var saleTitleLabel: UILabel!
    
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
    
    var categoryForRent: [CategoryName] = [
        CategoryName(title: "Все", isTapped: false),
        CategoryName(title: "Можно с собакой", isTapped: false),
        CategoryName(title: "Сдается студентам", isTapped: false),
        CategoryName(title: "от 2 500 000 сум / м²", isTapped: false),
        CategoryName(title: "Оставить заявку", isTapped: false),
        CategoryName(title: "Продать с Aparto", isTapped: false),
        CategoryName(title: "Отправить заявку", isTapped: false),
        CategoryName(title: "Смотреть все ЖК", isTapped: false),
        CategoryName(title: "Станьте партнером", isTapped: false),
    ]
    
    var adPhotoArr: [String] = ["sd","sd","cv","sd"]
    var newsData: [News] = []
    var newsCategoryData: [NewsCategory] = []
    var newsCategoryID: [String] = []
    var sellTypeData: [SellType] = []
    var sellTypePhoto: [String] = ["buy","rent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        setDetails()
        setCornerRadius()
        setLabelText()
        print("token 🐱 = ",Cache.getToken())
        Loader.start()
        getRentCategoryData()
        getNewsCategory()
        getSellTypeData()
    }

    func setDetails() {
        navigationItem.title = "Главная"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        setRightButtonForNav()
    }
    
    func setRightButtonForNav() {
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
        saleTitleLabel.font = UIFont(name: "ProximaNova-Semibold", size: 20)
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
        } else if collectionView == categoryRentCollectionView || collectionView == saleCollectionView {
            for i in 0...categoryForRent.count-1 {
                categoryForRent[i].isTapped = false
            }
            categoryRentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            saleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            print("keldi")
            print(" frame = ", categoryCollectionView.cellForItem(at: indexPath)?.frame)
            categoryForRent[indexPath.row].isTapped = true
            categoryRentCollectionView.reloadData()
            saleCollectionView.reloadData()
        }
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
           return CGSize(width: (self.categoryCollectionView.frame.width-16)/2.3, height: self.categoryCollectionView.frame.height)
        } else if collectionView == categoryRentCollectionView || collectionView == saleCollectionView {
            return CGSize(width: categoryForRent[indexPath.row].title.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .semibold))+40, height: 35)
         } else if collectionView == residentalComplexCollectionView {
           return CGSize(width: self.residentalComplexCollectionView.frame.width-70, height: self.residentalComplexCollectionView.frame.height)
         }  else if collectionView == salePhotoCollectionView {
            return CGSize(width: self.salePhotoCollectionView.frame.width-70, height: self.salePhotoCollectionView.frame.height)
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
            return adPhotoArr.count
        } else if collectionView == newsCollectionView {
            return newsData.count
        } else if collectionView == categoryCollectionView {
            return sellTypeData.count+1
        }
        return categoryForRent.count
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
        } else if collectionView == residentalComplexCollectionView || collectionView == rentPhotoCollectionView || collectionView == salePhotoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResidentalComplexCollectionViewCell.identifire, for: indexPath) as? ResidentalComplexCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(isHide: true,top: 0)
            return cell
        }  else if collectionView == adCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifire, for: indexPath) as? AdCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageViewOutlet.layer.cornerRadius = 8
            cell.imageViewOutlet.image = UIImage(named: "ad")
            return cell
        }  else if collectionView == companiesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompaniesCollectionViewCell.identifire, for: indexPath) as? CompaniesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setCell()
            return cell
        }  else if collectionView == housingIssuesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HousingIssuesCollectionViewCell.identifire, for: indexPath) as? HousingIssuesCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell()
            return cell
        }  else if collectionView == newsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifire, for: indexPath) as? NewsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(title: newsData[indexPath.row].title , category: translateTitle(title: getCategoryNews(id: newsData[indexPath.row].newsCategory)))
            return cell
        } else if collectionView == categoryRentCollectionView || collectionView == saleCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentCategoryCollectionViewCell.identifire, for: indexPath) as? RentCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.titleLabel.text = categoryForRent[indexPath.row].title
            cell.titleLabel.layer.cornerRadius = 8
            if categoryForRent[indexPath.row].isTapped {
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

    func getRentCategoryData() {
        if Reachability.isConnectedToNetwork() {
            API.getRentCategory { [self] (rentData) in
                Loader.stop()
//                categoryForRent = rentData!
                categoryRentCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
    
    func getNews() {
        if Reachability.isConnectedToNetwork() {
            API.getNews { [self] (news) in
                newsData = news!
                newsCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }

    func getNewsCategory() {
        if Reachability.isConnectedToNetwork() {
            API.getNewsCategory { [self] (newsCat) in
                newsCategoryData = newsCat!
                getNews()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }

    func getSellTypeData() {
        if Reachability.isConnectedToNetwork() {
            API.getSellType { [self] (type) in
                Loader.stop()
                sellTypeData = type!
                categoryCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }
    
}






