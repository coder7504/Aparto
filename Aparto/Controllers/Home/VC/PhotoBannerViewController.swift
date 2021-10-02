//
//  PhotoBannerViewController.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class PhotoBannerViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControllerOutlet: UIPageControl!
    @IBOutlet weak var sellButtonOutlet: UIButton!
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.delegate = self
            imageCollectionView.dataSource = self
            imageCollectionView.register(PhotoBannerCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoBannerCollectionViewCell.identifire)
        }
    }
    
    var imageArray: [String] = ["home","home","home","home","home","home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
    }

    fileprivate
    func setCornerRadius() {
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        pageControllerOutlet.numberOfPages = imageArray.count
        sellButtonOutlet.layer.cornerRadius = 12
        imageCollectionView.layer.cornerRadius = 8
    }
    @IBAction func notNowButtonTapped(_ sender: Any) {
      
    }
    
}


//  MARK: -- extension : UICollectionViewDelegate

extension PhotoBannerViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            pageControllerOutlet.currentPage = Int(round((scrollView.contentOffset.x) / scrollView.frame.width))
        }
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension PhotoBannerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.imageCollectionView.frame.width-10, height: self.imageCollectionView.frame.height)
    }
}


//  MARK: -- extension : UICollectionViewDataSource


extension PhotoBannerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoBannerCollectionViewCell.identifire, for: indexPath) as? PhotoBannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.imageVIewOutlet.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    
}
