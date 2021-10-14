//
//  PruductViewController.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/11/21.
//

import UIKit
import SDWebImage
import YandexMapsMobile

class PruductViewController: UIViewController {
    
    @IBOutlet weak var productPhotoCollectionView: UICollectionView! {
        didSet {
            productPhotoCollectionView.delegate = self
            productPhotoCollectionView.dataSource = self
            productPhotoCollectionView.register( ProductPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductPhotoCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var pageControllerCollectionView: UICollectionView!  {
        didSet {
            pageControllerCollectionView.delegate = self
            pageControllerCollectionView.dataSource = self
            pageControllerCollectionView.register( PageContrllerCollectionViewCell.nib(), forCellWithReuseIdentifier: PageContrllerCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var adCollectionView: UICollectionView! {
        didSet {
            adCollectionView.delegate = self
            adCollectionView.dataSource = self
            adCollectionView.register(AdCollectionViewCell.nib(), forCellWithReuseIdentifier: AdCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var saleAdsCollectionView: UICollectionView!  {
        didSet {
            saleAdsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            saleAdsCollectionView.delegate = self
            saleAdsCollectionView.dataSource = self
            saleAdsCollectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var recentlyViewedAdsCollectionView: UICollectionView! {
        didSet {
            recentlyViewedAdsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            recentlyViewedAdsCollectionView.delegate = self
            recentlyViewedAdsCollectionView.dataSource = self
            recentlyViewedAdsCollectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var hidePhoneButtonOutlet: UIButton!
    @IBOutlet weak var bottomPhoneButtonOutlet: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var squareLabel: UILabel!
    @IBOutlet weak var numberOfRoomLabel: UILabel!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var heightOfCeilingLabel: UILabel!
    @IBOutlet weak var allPriceLabel: UILabel!
    @IBOutlet weak var smallPriceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    
    var bell = UIBarButtonItem()
    var heart = UIBarButtonItem()
    var data: Announcement!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
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
    
    var pageContArray: [CategoryName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0...data.images.count-1 {
           let d = CategoryName(title: "sdw", isTapped: true)
               pageContArray.append(d)
        }
        setBackroundImageForNavigation()
        setRightButtonForNav()
        setLabelText()
    }
    
    func setLabelText() {
        titleLabel.text = data.title
//        squareLabel.text = "\(data.newBuildingValues.planTypes[0].area.from*data.newBuildingValues.planTypes[0].area.to)"
//        numberOfRoomLabel.text = "\(data.newBuildingValues.planTypes[0].apartmentQuantity)"
//        floorLabel.text = "\(data.newBuildingValues.planTypes[0].cost.from) из \(data.newBuildingValues.planTypes[0].cost.to)"
//        heightOfCeilingLabel.text = "\(data.newBuildingValues.planTypes[0].area.from*data.newBuildingValues.planTypes[0].area.to)"
        allPriceLabel.text = "\(data.price.currency.currencyRate*data.price.amount)"
        smallPriceLabel.text = "\(data.price.currency.currencyRate)"
        districtLabel.text = translateTitle(title: data.district.name)
    }
    
    func setRightButtonForNav() {
        navigationController?.navigationBar.tintColor = UIColor.white
        bell = UIBarButtonItem(image: UIImage(named: "more"), style: .done, target: self, action: #selector(bellTapped))
        heart = UIBarButtonItem(image: UIImage(named: "heart"), style: .done, target: self, action: #selector(heartTapped))
        bell.tintColor = .white
        heart.tintColor = .white
        navigationItem.rightBarButtonItems = [bell,heart]
    }
    
    @objc func bellTapped() {
        print("Bell")
    }
    
    @objc func heartTapped() {
        print("Heart")
        Alert.showAlert(forState: .addFavorite, message: "Объявление добавлено в избранные")
    }
    
    func setBackroundImageForNavigation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setNavigation(){
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
    }
    
    @IBAction func showPhoneNumberButtonTapped(_ sender: Any) {
        let vc = ProductPagePhoneViewController(nibName: "ProductPagePhoneViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func showAllConvenienceButtonTaped(_ sender: Any) {
        let vc = AllConvenienceViewController(nibName: "AllConvenienceViewController", bundle: nil)
        vc.titleArray = data.comfortType
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func showAllInformationButtonTaped(_ sender: Any) {
        let vc = AllInformationViewController(nibName: "AllInformationViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.hidePhoneButtonOutlet.transform = CGAffineTransform(translationX: 0, y: 100)
            self.bottomPhoneButtonOutlet.isHidden = false
        }
    }
    
    @IBAction func scrollAdButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) { [self] in
            if sender.tag == 0 {
                adCollectionView.contentOffset.x = 0
                scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
                scrollAdButtonOutlet[1].transform = .identity
            } else {
                adCollectionView.contentOffset.x = adCollectionView.contentSize.width -  adCollectionView.frame.width
                scrollAdButtonOutlet[1].transform = CGAffineTransform(translationX: 100, y: 0)
                scrollAdButtonOutlet[0].transform = .identity
            }
        }
    }
    
    @IBAction func openMapButtonTapped(_ sender: Any) {
        let vc = SearchFromMapViewController(nibName: "SearchFromMapViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.largeTitle = "Предложения рядом"
        vc.coordinate = YMKPoint(latitude: data.coordinates[0], longitude: data.coordinates[1])
        present(vc, animated: false, completion: nil    )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    
}







//  MARK: -- extension : UICollectionViewDelegate

extension PruductViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
        if collectionView == pageControllerCollectionView {
            if !pageContArray.isEmpty {
                for i in 0...pageContArray.count-1 {
                    pageContArray[i].isTapped = false
                }
                productPhotoCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
                pageContArray[indexPath.row].isTapped = true
                pageControllerCollectionView.reloadData()
            }
        }
        
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension PruductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pageControllerCollectionView {
            return CGSize(width: (self.pageControllerCollectionView.frame.width-16)/CGFloat(pageContArray.count), height: self.pageControllerCollectionView.frame.height)
        } else if collectionView == productPhotoCollectionView {
            return CGSize(width: self.productPhotoCollectionView.frame.width, height: self.productPhotoCollectionView.frame.height*1.5)
        } else if collectionView == adCollectionView {
            return CGSize(width: self.adCollectionView.frame.width, height: self.adCollectionView.frame.height)
          } else if collectionView == saleAdsCollectionView {
            return CGSize(width: self.saleAdsCollectionView.frame.width-70, height: self.saleAdsCollectionView.frame.height)
          } else if collectionView == recentlyViewedAdsCollectionView {
            return CGSize(width: self.recentlyViewedAdsCollectionView.frame.width-70, height: self.recentlyViewedAdsCollectionView.frame.height)
          }
        
        return CGSize(width: self.productPhotoCollectionView.frame.width, height: self.productPhotoCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension PruductViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pageControllerCollectionView || collectionView == productPhotoCollectionView {
            return data.images.count
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productPhotoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductPhotoCollectionViewCell.identifire, for: indexPath) as? ProductPhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        } else if collectionView == pageControllerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageContrllerCollectionViewCell.identifire, for: indexPath) as? PageContrllerCollectionViewCell else {
                return UICollectionViewCell()
            }
            if pageContArray[indexPath.row].isTapped {
                cell.colorView.backgroundColor = UIColor.white
            } else {
                cell.colorView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
            }
            return cell
        }  else if collectionView == adCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifire, for: indexPath) as? AdCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageViewOutlet.layer.cornerRadius = 8
            cell.imageViewOutlet.sd_setImage(with: URL(string: API.imageBaseUrl+data.images[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "home-1"))
            return cell
        }  else if collectionView == saleAdsCollectionView || collectionView == recentlyViewedAdsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResidentalComplexCollectionViewCell.identifire, for: indexPath) as? ResidentalComplexCollectionViewCell else {
                return UICollectionViewCell()
            }
            //            MARK: -- bitta advertisementni id sini beriwkk 61226f1ea1c0dbaceeb70ee7
            cell.updateCell(isHide: true, top: 0, title: "title", desc: "description", price: 0, image: "", _id: data._id)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
}




extension PruductViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView == adCollectionView {
            UIView.animate(withDuration: 0.3) {
                self.scrollAdButtonOutlet[0].transform = CGAffineTransform(translationX: -100, y: 0)
                self.scrollAdButtonOutlet[1].transform = CGAffineTransform(translationX: 100, y: 0)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView ==  self.scrollView {
            if scrollView.contentOffset.y > 250 {
                setNavigation()
                bell.tintColor = .black
                heart.tintColor = .black
                navigationController?.navigationBar.tintColor = UIColor.black
            } else {
                bell.tintColor = .white
                heart.tintColor = .white
                navigationController?.navigationBar.tintColor = UIColor.white
                setBackroundImageForNavigation()
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        configureEndHelperButtons(with: scrollView)
        if scrollView == productPhotoCollectionView {
            let cellIndex = Int(round((scrollView.contentOffset.x) / scrollView.frame.width))
            for i in 0...pageContArray.count-1 {
                pageContArray[i].isTapped = false
            }
            pageContArray[cellIndex].isTapped = true
            pageControllerCollectionView.reloadData()
        }
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

