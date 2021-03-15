//
//  MainController.swift
//  RefreshControlExamples
//
//  Created by Mark Norgren on 3/15/21.
//

import Foundation
import UIKit

class MainController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainController - viewDidLoad")
        setupTabBarViewControllers()
        extendedLayoutIncludesOpaqueBars = true
        edgesForExtendedLayout = .all
    }

    func setupTabBarViewControllers() {

        let firstVC = FirstViewController()
        firstVC.title = "FIRST"
        firstVC.tabBarItem = UITabBarItem(title: "CollectionView", image: UIImage(systemName: "flame.fill"), tag: 0)
        firstVC.extendedLayoutIncludesOpaqueBars = true
        

        let firstNavController = UINavigationController(rootViewController: firstVC)
        firstNavController.navigationBar.prefersLargeTitles = true

        let collectionVC = ExampleCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        collectionVC.tabBarItem = UITabBarItem(title: "CollectionVC", image: UIImage(systemName: "list.triangle"), tag: 0)

        let collectionViewNavController = UINavigationController(rootViewController: collectionVC)
        collectionVC.title = "CollectionVC"
        collectionViewNavController.navigationBar.prefersLargeTitles = true
        viewControllers = [firstNavController, collectionViewNavController]

    }
}
