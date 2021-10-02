//
//  NewBuildingAnnouncementViewController.swift
//  Aparto
//
//  Created by Mac user on 14/09/21.
//

import UIKit

class NewBuildingAnnouncementViewController: UIViewController {
    
    @IBOutlet weak var currencyTextField: UITextField!{
        didSet {
            currencyTextField.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var categoryRentCollectionView: UICollectionView! {
        didSet {
            categoryRentCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            categoryRentCollectionView.delegate = self
            categoryRentCollectionView.dataSource = self
            categoryRentCollectionView.register(RentCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: RentCategoryCollectionViewCell.identifire)
        }
    }
    
    var categoryForRent = [
        "Об объекте",
        "Локация",
        "О здании",
        "Список инфраструктур",
        "Популярное: Аренда",
        "Оставить заявку",
        "Продать с Aparto",
        "Отправить заявку",
        "Смотреть все ЖК",
        "Станьте партнером"
    ]
    
    @IBOutlet weak var complexNameView: CustomTextFieldView! {
        didSet {
            complexNameView.topTitle = "Название комплекса"
            complexNameView.mainTitle = "OOO Golden Bridge"
            complexNameView.rightImage = nil
        }
    }
    
    @IBOutlet weak var buitYearView: CustomTextFieldView! {
        didSet {
            buitYearView.topTitle = "Год постройки"
            buitYearView.mainTitle = "2012"
            buitYearView.rightImage = nil
        }
    }
    
    @IBOutlet weak var buildingPermitView: CustomView! {
        didSet {
            buildingPermitView.topTitle = "Разрешение на строительство"
            buildingPermitView.mainTitle = "Жилая"
        }
    }
    
    @IBOutlet weak var cityAndStreetView: CustomTextFieldView! {
        didSet {
            cityAndStreetView.topTitle = "Город и улица"
            cityAndStreetView.mainTitle = "OOO Golden Bridge"
            cityAndStreetView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var chooseButtonOutlet: CustomBtn!
    
    @IBOutlet weak var quarterView: CustomTextFieldView! {
        didSet {
            quarterView.topTitle = "Квартал "
            quarterView.mainTitle = "5"
            quarterView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var houseView: CustomTextFieldView! {
        didSet {
            houseView.topTitle = "Дом "
            houseView.mainTitle = "66"
            houseView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var entranceView: CustomTextFieldView! {
        didSet {
            entranceView.topTitle = "Подъезд"
            entranceView.mainTitle = "5"
            entranceView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var apartmentView: CustomTextFieldView! {
        didSet {
            apartmentView.topTitle = "Квартира"
            apartmentView.mainTitle = "66"
            apartmentView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var buildingTypeView: CustomView! {
        didSet {
            buildingTypeView.topTitle = "Тип строения"
            buildingTypeView.mainTitle = "Кирпичный"
        }
    }
    
    @IBOutlet weak var NumberOfStoreysView: CustomTextFieldView! {
        didSet {
            NumberOfStoreysView.topTitle = "Этажность"
            NumberOfStoreysView.mainTitle = "15"
            NumberOfStoreysView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var buildingTypView: CustomView! {
        didSet {
            buildingTypView.topTitle = "Тип строения"
            buildingTypView.mainTitle = "Состояние"
        }
    }
    
    @IBOutlet weak var fromView: CustomTextFieldView! {
        didSet {
            fromView.topTitle = "от"
            fromView.mainTitle = "5"
            fromView.rightImage = nil
        }
    }
    
    @IBOutlet weak var beforeView: CustomTextFieldView! {
        didSet {
            beforeView.topTitle = "до"
            beforeView.mainTitle = "66"
            beforeView.rightImage = nil
        }
    }
    
    @IBOutlet weak var repairView: CustomView! {
        didSet {
            repairView.topTitle = "Ремонт"
            repairView.mainTitle = "Евро"
        }
    }
    
    @IBOutlet weak var repair1View: CustomView! {
        didSet {
            repair1View.topTitle = "Ремонт"
            repair1View.mainTitle = "Евро"
        }
    }
    
    @IBOutlet weak var bathroomView: CustomView! {
        didSet {
            bathroomView.topTitle = "Санузел"
            bathroomView.mainTitle = "Совмещенный"
        }
    }
    
    @IBOutlet weak var heatingView: CustomView! {
        didSet {
            heatingView.topTitle = "Отопление"
            heatingView.mainTitle = "Центральное"
        }
    }
    
    @IBOutlet weak var houseTypeView: CustomView! {
        didSet {
            houseTypeView.topTitle = "Тип дома"
            houseTypeView.mainTitle = "Кирпичный"
        }
    }
    
    @IBOutlet weak var ceilingHeightView: CustomTextFieldView! {
        didSet {
            ceilingHeightView.topTitle = "Высота потолка"
            ceilingHeightView.mainTitle = "3 м"
            ceilingHeightView.rightImage = nil
        }
    }
    
    @IBOutlet weak var passengerElevatorView: CustomView! {
        didSet {
            passengerElevatorView.topTitle = "Пасажирский лифт"
            passengerElevatorView.mainTitle = "2"
        }
    }
    
    @IBOutlet weak var serviceLiftView: CustomView! {
        didSet {
            serviceLiftView.topTitle = "Грузовой лифт"
            serviceLiftView.mainTitle = "Нет"
        }
    }
    
    @IBOutlet weak var rampView: CustomView! {
        didSet {
            rampView.topTitle = "Пандус"
            rampView.mainTitle = "Нет"
        }
    }
    
    @IBOutlet weak var parkingView: CustomView! {
        didSet {
            parkingView.topTitle = "Парковка"
            parkingView.mainTitle = "Нет"
        }
    }
    
    @IBOutlet weak var LinkToVideoView: CustomTextFieldView! {
        didSet {
            LinkToVideoView.topTitle = "Ссылка на видео"
            LinkToVideoView.mainTitle = "www.youtube.com"
            LinkToVideoView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var apartmentTypView: CustomTextFieldView! {
        didSet {
            apartmentTypView.topTitle = "Тип апартаментов"
            apartmentTypView.mainTitle = "www.youtube.com"
            apartmentTypView.rightImage = nil
            
        }
    }
    
    @IBOutlet weak var squareView: CustomTextFieldView! {
        didSet {
            squareView.topTitle = "Площадь"
            squareView.mainTitle = "150"
            squareView.rightImage = nil
        }
    }
    
    @IBOutlet var noButtonOutlet: [CustomBtn]! {
        didSet {
            for i in noButtonOutlet {
                i.setTitle("Нет", for: .normal)
                i.setTitleColor(.black, for: .normal)
                i.backgroundColor = UIColor.hovered
            }
        }
    }
    
    @IBOutlet weak var borderView: UIView! {
        didSet {
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = #colorLiteral(red: 0.9253990054, green: 0.9255540371, blue: 0.925378561, alpha: 0.9999998989)
        }
    }
    
    @IBOutlet weak var switchButtonOutlet: UISwitch! {
        didSet {
            switchButtonOutlet.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }
    }
    
    @IBOutlet weak var checkImageView: UIImageView!
    
    @IBOutlet var circleCheckImageVIewCol: [UIImageView]! {
        didSet {
            for i in circleCheckImageVIewCol {
                i.isHidden = true
            }
        }
    }
    
    @IBOutlet var familyButtonsOutlet: [CustomBtn]!
    
    @IBOutlet var studentButtonsOutlet: [CustomBtn]!
    
    @IBOutlet var withChildrenButtonsOutlet: [CustomBtn]!
    
    @IBOutlet var withAnimalsButtonsOutlet: [CustomBtn]! 
    
    @IBOutlet var specialBadgesViewColect: [UIView]!
    
    var isChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = "Добавление объекта"
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
    
    @IBAction func bargainingButtonTapped(_ sender: Any) {
        isChecked = !isChecked
        checkImageView.image = isChecked ? UIImage(named: "check_Icon") : nil
    }
    
    @IBAction func specialBadgesButtonTapped(_ sender: UIButton) {
        for i in specialBadgesViewColect {
            i.layer.borderColor = UIColor.clear.cgColor
        }
        for i in circleCheckImageVIewCol {
            i.isHidden = true
        }
        circleCheckImageVIewCol[sender.tag].isHidden = false
        specialBadgesViewColect[sender.tag].layer.borderWidth = 2
        specialBadgesViewColect[sender.tag].layer.borderColor = UIColor.main.cgColor
    }
    
    @IBAction func plansButtonPressed(_ sender: Any) {
        let vc = PlansViewController(nibName: "PlansViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func repairButtonPressed(_ sender: Any) {
        let vc = ChooseRepairViewController(nibName: "ChooseRepairViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let vc = ObjectTypeForSaleViewController(nibName: "ObjectTypeForSaleViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func familyButtonTapped(_ sender: UIButton) {
        for i in familyButtonsOutlet {
            i.backgroundColor = UIColor.hovered
            i.titleLabel?.textColor = .black
        }
        familyButtonsOutlet[sender.tag].backgroundColor = UIColor.main
        familyButtonsOutlet[sender.tag].titleLabel?.textColor = .black
    }
    
    @IBAction func withChildButtonTapped(_ sender: UIButton) {
        for i in withChildrenButtonsOutlet {
            i.backgroundColor = UIColor.hovered
            i.titleLabel?.textColor = .black
        }
        withChildrenButtonsOutlet[sender.tag].backgroundColor = UIColor.main
        withChildrenButtonsOutlet[sender.tag].titleLabel?.textColor = .black
    }
    
    @IBAction func studentButtonTapped(_ sender: UIButton) {
        for i in studentButtonsOutlet {
            i.backgroundColor = UIColor.hovered
            i.titleLabel?.textColor = .black
        }
        studentButtonsOutlet[sender.tag].backgroundColor = UIColor.main
        studentButtonsOutlet[sender.tag].titleLabel?.textColor = .black
    }
    
    @IBAction func withAnimalButtonTapped(_ sender: UIButton) {
        for i in withAnimalsButtonsOutlet {
            i.backgroundColor = UIColor.hovered
            i.titleLabel?.textColor = .black
        }
        withAnimalsButtonsOutlet[sender.tag].backgroundColor = UIColor.main
        withAnimalsButtonsOutlet[sender.tag].titleLabel?.textColor = .black
    }
    
    
    @IBAction func currencyButtonTapped(_ sender: Any) {
        let vc = ComplaintViewController(nibName: "ComplaintViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.currencyDelegate = self
        vc.isCurrency = true
        present(vc, animated: false, completion: nil)
    }
    
}






//  MARK: -- extension : UICollectionViewDelegate

extension NewBuildingAnnouncementViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension NewBuildingAnnouncementViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryRentCollectionView {
            return CGSize(width: categoryForRent[indexPath.row].widthOfString(usingFont: .systemFont(ofSize: 16, weight: .semibold))+40, height: 35)
        }
        return CGSize(width: self.categoryRentCollectionView.frame.width-70, height: self.categoryRentCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension NewBuildingAnnouncementViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryForRent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryRentCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentCategoryCollectionViewCell.identifire, for: indexPath) as? RentCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.titleLabel.text = categoryForRent[indexPath.row]
            cell.titleLabel.layer.cornerRadius = 8
            cell.titleLabel.clipsToBounds = true
            cell.titleLabel.backgroundColor = UIColor.hovered
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
}


//  MARK: -- Delegates

extension NewBuildingAnnouncementViewController: CurrentCurrency {
    func currency(curreny: Currency) {
        currencyLabel.text = "\(curreny.name)"
    }
}
