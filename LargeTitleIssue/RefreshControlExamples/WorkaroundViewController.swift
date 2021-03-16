//
//  WorkaroundViewController.swift
//  RefreshControlExamples
//
//  Created by Mark Norgren on 3/16/21.
//

import UIKit

class WorkaroundViewController: UIViewController {

    var refreshControl = UIRefreshControl()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let cellId = "exampleCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setupRefreshControl()
        setupCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupRefreshControl()
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.backgroundColor = .clear
        collectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(ExampleCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
    }

    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }

    @objc func refresh() {
        print("refresh")

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.collectionView.performBatchUpdates({
                let indexSet = IndexSet(integer: 0)
                self?.collectionView.reloadSections(indexSet)
            }, completion: nil)

        }
    }
}

extension WorkaroundViewController: UICollectionViewDataSource {
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

