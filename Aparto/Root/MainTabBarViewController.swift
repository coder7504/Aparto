//
//  MainTabBarViewController.swift
//  Aparto
//
//  Created by Mac user on 15/09/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        
        let firstViewController = UINavigationController(rootViewController: HomeViewController(nibName: "HomeViewController", bundle: nil))
        let firstTabbatItem = UITabBarItem(title: "Главная", image: UIImage(named: "homeTabbar"), selectedImage: nil)
        firstViewController.tabBarItem = firstTabbatItem
        
        let secondViewController = UINavigationController(rootViewController:  SearchVC())
        let secondTabbatItem = UITabBarItem(title: "Поиск", image: UIImage(named: "search"), selectedImage: nil)
        secondViewController.tabBarItem = secondTabbatItem
        
        let thirdViewController = UINavigationController(rootViewController:  MyProfileFavoriteViewController(nibName: "MyProfileFavoriteViewController", bundle: nil))
        let thirdTabbatItem = UITabBarItem(title: "Избранные", image: UIImage(named: "heartTabBar"), selectedImage: nil)
        thirdViewController.tabBarItem = thirdTabbatItem
        
        let fourViewController = UINavigationController(rootViewController:  MyProfileMailViewController(nibName: "MyProfileMailViewController", bundle: nil))
        let fourTabbatItem = UITabBarItem(title: "Чаты", image: UIImage(named: "message_TabBar"), selectedImage: nil)
        fourViewController.tabBarItem = fourTabbatItem
        
        let fiveViewController = UINavigationController(rootViewController:  ProfilePageViewController(nibName: "ProfilePageViewController", bundle: nil))
        let fiveTabbatItem = UITabBarItem(title: "Кабинет", image: UIImage(named: "personTabbar"), selectedImage: nil)
        fiveViewController.tabBarItem = fiveTabbatItem
        
        self.viewControllers = [firstViewController,secondViewController,thirdViewController,fourViewController,fiveViewController]
        self.tabBar.tintColor = .main
        self.tabBar.barTintColor = .tabBar
        self.tabBar.unselectedItemTintColor = .unSelected
    }
    

}
