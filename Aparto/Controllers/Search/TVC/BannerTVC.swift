//
//  BannerTVC.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 11/09/21.
//

import UIKit

class BannerTVC: UITableViewCell {

    static let identifier = "BannerTVC"
    static func nib()->UINib {
        UINib(nibName: "BannerTVC", bundle: nil)
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
//            collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            collectionView.register(AdCollectionViewCell.nib(), forCellWithReuseIdentifier: AdCollectionViewCell.identifire)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}



extension BannerTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}

extension BannerTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifire, for: indexPath)
        
        return cell
    }
    
    
}
