//
//  ViewControllerCollectionViewExample.swift
//  RefreshControl
//
//  Created by Mark Norgren on 3/10/21.
//

import UIKit

class ViewControllerCollectionViewExample: UIViewController {

    let data = ["test", "test 12", "test 123"]

    @IBOutlet weak var collectionView: UICollectionView!
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }

    @objc func refresh() {
        print("refresh")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}


extension ViewControllerCollectionViewExample: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
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


