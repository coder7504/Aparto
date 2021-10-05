//
//  SelectNewsViewController.swift
//  Aparto
//
//  Created by Mac user on 05/10/21.
//

import UIKit
import SDWebImage

class SelectNewsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var seenLabel: UILabel!
    @IBOutlet weak var newsCollectionView: UICollectionView! {
        didSet {
            newsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            newsCollectionView.delegate = self
            newsCollectionView.dataSource = self
            newsCollectionView.register( NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsCollectionViewCell.identifire)
        }
    }
    
    var newsDatas: [News] = []
    var newsData: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        setLabelsText()
    }
    
    func setLabelsText() {
        if newsData != nil {
            imageView.sd_setImage(with: URL(string: API.baseUrl + "/" + newsData.image), placeholderImage: #imageLiteral(resourceName: "selectNews"))
            titleLabel.text = newsData.title
            descriptionLabel.text = newsData.description
            likeLabel.text = "\(newsData.liked)"
            seenLabel.text = "\(newsData.seen)"
            dateLabel.text = convertToOrdinary(fromJSForm: newsData.createdAt)
        }
    }
  
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
           navigationItem.title = "Новости"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]

            removeButtomLineNavigation()
            setBackroundImageForNavigation()
       }
       
    func setBackroundImageForNavigation(){
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
}






//  MARK: -- extension : UICollectionViewDelegate

extension SelectNewsViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect news")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout


extension SelectNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.newsCollectionView.frame.width/1.2, height: self.newsCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension SelectNewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifire, for: indexPath) as? NewsCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.containerView.backgroundColor = .white
            cell.updateCell(title: newsDatas[indexPath.row].title , category: translateTitle(title: newsDatas[indexPath.row].newsCategory.name))
            return cell
    }
    
    
}


