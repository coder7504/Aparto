//
//  SearchAdTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/20/21.
//

import UIKit

protocol MoreAboutAnnouncement {
    func moreTapped()
}

class SearchAdTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(ResidentalComplexCollectionViewCell.nib(), forCellWithReuseIdentifier: ResidentalComplexCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var hideStackView: UIStackView!
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
            categoryCollectionView.register(ProfileCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: ProfileCategoryCollectionViewCell.identifire)
        }
    }
    
    var delegete: MoreAboutAnnouncement!
    
    static let identifire: String = "SearchAdTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "SearchAdTableViewCell", bundle: nil)
    }
    
    
    var category = [
        "Все",
        "Можно с собакой",
        "Сдается студентам",
        "от 2 500 000 сум / м²",
        "Популярное: Аренда",
        "Оставить заявку",
        "Продать с Aparto",
        "Отправить заявку",
        "Смотреть все ЖК",
        "Станьте партнером"
    ]
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        delegete.moreTapped()
    }
    
}






//  MARK: -- extension : UICollectionViewDelegate

extension SearchAdTableViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("SearchAdTableViewCell didselect")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension SearchAdTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return CGSize(width: self.collectionView.frame.width-70, height: self.collectionView.frame.height)
        } else {
            return CGSize(width: category[indexPath.row].widthOfString(usingFont: .systemFont(ofSize: 16, weight: .semibold))+60, height: categoryCollectionView.frame.height-16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension SearchAdTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 20
        } else {
            return category.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResidentalComplexCollectionViewCell.identifire, for: indexPath) as? ResidentalComplexCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(isHide: false, top: 20, title: "title", desc: "description", price: 0)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCategoryCollectionViewCell.identifire, for: indexPath) as? ProfileCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(title: category[indexPath.row])
            return cell
        }
            
    }
    
}
