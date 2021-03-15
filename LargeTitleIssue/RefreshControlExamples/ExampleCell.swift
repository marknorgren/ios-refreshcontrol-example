//
//  ExampleCell.swift
//  RefreshControlExamples
//
//  Created by Mark Norgren on 3/15/21.
//

import Foundation
import UIKit

class ExampleCell: UICollectionViewCell {

    let title = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        title.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
