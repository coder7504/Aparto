//
//  AllNewsViewController.swift
//  Aparto
//
//  Created by Mac user on 09/10/21.
//

import UIKit

class AllNewsViewController: UIViewController {

    @IBOutlet weak var allCollectionView: UICollectionView! {
        didSet {
            allCollectionView.delegate  = self
            allCollectionView.dataSource = self
            allCollectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
            allCollectionView.register(PhotoUnderTitleCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoUnderTitleCollectionViewCell.identifire)
            allCollectionView.register(NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsCollectionViewCell.identifire)
            allCollectionView.register(AdForNewsCollectionViewCell.nib(), forCellWithReuseIdentifier: AdForNewsCollectionViewCell.identifire)

        }
    }
    
    var newsData: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Loader.start()
        setDetails()
        getNews(limit: Cache.getNewsLength() ?? 0, skip: 0)
    }

    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
           navigationItem.title = "Новости и статьи"
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
    
    func getNews(limit: Int, skip: Int) {
        if Reachability.isConnectedToNetwork() {
            API.getNews(limit: limit, skip: skip) { [self] (news) in
                Loader.stop()
                if let new = news {
                    print("")
                    print("new = ", new)
                    newsData.append(contentsOf: new)
                }
                allCollectionView.reloadData()
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
    }

}






//  MARK: -- extension : UICollectionViewDelegate

extension AllNewsViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
    }
    
}


//  MARK: -- extension : UICollectionViewDelegateFlowLayout

extension AllNewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < 2 {
            return CGSize(width: self.allCollectionView.frame.width, height: self.allCollectionView.frame.height/3.4)
        } else if indexPath.item == 2 {
            return CGSize(width: self.allCollectionView.frame.width, height: self.allCollectionView.frame.height/2.4)
        } else {
            return CGSize(width: self.allCollectionView.frame.width, height: self.allCollectionView.frame.height/6)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}


//  MARK: -- extension : UICollectionViewDataSource


extension AllNewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoUnderTitleCollectionViewCell.identifire, for: indexPath) as? PhotoUnderTitleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(image: "api/\(newsData[indexPath.item].image)", title: translateTitle(title: newsData[indexPath.item].newsCategory.name), desc: newsData[indexPath.item].title)
            return cell
        } else if indexPath.item == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdForNewsCollectionViewCell.identifire, for: indexPath) as? AdForNewsCollectionViewCell else {
                return UICollectionViewCell()
            }
//            cell.updateCell(image: "api/\(newsData[indexPath.item].image)", title: translateTitle(title: newsData[indexPath.item].newsCategory.name), desc: newsData[indexPath.item].title)
            cell.updateCell(isNull: 0)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifire, for: indexPath) as? NewsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(title: newsData[indexPath.item].title, category: translateTitle(title: newsData[indexPath.item].newsCategory.name), isTimeYes: true)
            cell.timeLabel.text = convertToOrdinary(fromJSForm: newsData[indexPath.item].createdAt)
            return  cell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if collectionView == newsCollectionView {
//            if indexPath.item % newsLimit == newsLimit-1 {
//                print(indexPath.item,"😱😱😱😱😱 ",Cache.getNewsLength())
//                    if (Cache.getNewsLength() ?? 0) != indexPath.row+1 {
//                        self.getNews(limit: newsLimit, skip: indexPath.item+1)
//                    }
//                }
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if collectionView == newsCollectionView {
//            if indexPath.item % newsLimit == newsLimit-1 {
//                print(indexPath.item,"😱😱😱😱😱 ",Cache.getNewsLength())
//                    if (Cache.getNewsLength() ?? 0) != indexPath.row+1 {
//                        self.getNews(limit: newsLimit, skip: indexPath.item+1)
//                    }
//                }
//        }
//
//    }
    
}
