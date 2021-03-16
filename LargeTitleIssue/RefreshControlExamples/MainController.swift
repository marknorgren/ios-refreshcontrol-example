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
    }

    func setupTabBarViewControllers() {

        let firstNavVC = makeFirstNavController()
        let secondNavVC = makeSecondNavController()
        let thirdNavVC = makeThirdNavController()
        viewControllers = [firstNavVC, secondNavVC, thirdNavVC]

    }

    func makeFirstNavController() -> UINavigationController {
        let firstVC = FirstViewController()
        firstVC.title = "CollectionView"
        firstVC.tabBarItem = UITabBarItem(title: "CollectionView", image: UIImage(systemName: "hand.thumbsdown.fill"), tag: 0)

        let firstNavController = UINavigationController(rootViewController: firstVC)
        firstNavController.navigationBar.prefersLargeTitles = true
        return firstNavController
    }

    func makeSecondNavController() -> UINavigationController {
        let collectionVC = ExampleCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        collectionVC.tabBarItem = UITabBarItem(title: "CollectionVC", image: UIImage(systemName: "hand.thumbsup.fill"), tag: 0)

        let collectionViewNavController = UINavigationController(rootViewController: collectionVC)
        collectionVC.title = "CollectionVC"
        collectionViewNavController.navigationBar.prefersLargeTitles = true
        return collectionViewNavController
    }

    func makeThirdNavController() -> UINavigationController {
        let collectionVC = WorkaroundViewController()
        collectionVC.tabBarItem = UITabBarItem(title: "Workaround", image: UIImage(systemName: "hands.sparkles.fill"), tag: 0)

        let collectionViewNavController = UINavigationController(rootViewController: collectionVC)
        collectionVC.title = "Workaround"
        collectionViewNavController.navigationBar.prefersLargeTitles = true
        return collectionViewNavController
    }
}
