//
//  FirstViewController.swift
//  RefreshControlExamples
//
//  Created by Mark Norgren on 3/15/21.
//

import UIKit

class FirstViewController: UIViewController {

    let refreshControl = UIRefreshControl()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let cellId = "exampleCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .all

        setupRefreshControl()
        setupCollectionView()
    }

    func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(ExampleCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
    }

    func setupRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }

    @objc func refresh() {
        print("refresh")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as UICollectionViewCell
        cell.backgroundColor = self.randomColor()
        return cell
    }

    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
