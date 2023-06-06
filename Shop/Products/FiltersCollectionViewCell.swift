//
//  FiltersCollectionViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 06.06.23.
//

import UIKit
protocol FiltersProtocol {
    var filterName: String {get}
}

class FiltersCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var filterName: UIButton!
    
    
    static let identifier = "FiltersCollectionViewCell"
    

    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(data: FiltersProtocol) {
        filterName.setTitle(data.filterName, for: .normal)
    }

}
