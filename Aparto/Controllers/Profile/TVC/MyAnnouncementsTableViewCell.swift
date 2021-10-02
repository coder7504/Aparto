//
//  MyAnnouncementsTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyAnnouncementsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.shadowColor = #colorLiteral(red: 0.8929855227, green: 0.8946463466, blue: 0.8900819421, alpha: 1)
            containerView.layer.shadowRadius = 6
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 1
        }
    }
    
    static let identifire: String = "MyAnnouncementsTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyAnnouncementsTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var bigPhotoCollectionView: UICollectionView! {
        didSet {
            bigPhotoCollectionView.delegate = self
            bigPhotoCollectionView.dataSource = self
            bigPhotoCollectionView.register(MyAnnouncementsBigPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: MyAnnouncementsBigPhotoCollectionViewCell.identifire)
        }
    }
    
    @IBOutlet weak var smallCollectionView: UICollectionView! {
        didSet {
            smallCollectionView.delegate = self
            smallCollectionView.dataSource = self
            smallCollectionView.register(MyAnnouncementsSmallPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: MyAnnouncementsSmallPhotoCollectionViewCell.identifire)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}






//  MARK: -- extension : UICollectionViewDelegate

extension MyAnnouncementsTableViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("didselect  MyAnnouncementsTableViewCell")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension MyAnnouncementsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bigPhotoCollectionView {
           return CGSize(width: self.bigPhotoCollectionView.frame.width, height: self.bigPhotoCollectionView.frame.height)
        } else if collectionView == smallCollectionView  {
            return CGSize(width: (self.smallCollectionView.frame.width-30)/4, height: self.smallCollectionView.frame.height)
         }
        return CGSize(width: self.bigPhotoCollectionView.frame.width-70, height: self.bigPhotoCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension MyAnnouncementsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bigPhotoCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAnnouncementsBigPhotoCollectionViewCell.identifire, for: indexPath) as? MyAnnouncementsBigPhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if collectionView == smallCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAnnouncementsSmallPhotoCollectionViewCell.identifire, for: indexPath) as? MyAnnouncementsSmallPhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
       return UICollectionViewCell()
    }
    
    
}
