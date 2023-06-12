//
//  UIKitProductCollectionViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 27.05.23.
//

import UIKit

protocol ProductCellProtocol {
    var itemName: String {get}
    var regularPriceText: String {get}
    var img: String {get}
}

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var regularPriceText: UILabel!
    @IBOutlet weak var itemName: UILabel!
 
    static let identifier = "ProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(data: ProductCellProtocol) {
        itemName.text = data.itemName
        regularPriceText.text = "\(data.regularPriceText) ₼"
        img.loadUrl(data.img)
    }
    
}
