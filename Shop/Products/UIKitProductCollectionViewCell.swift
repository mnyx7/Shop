//
//  UIKitProductCollectionViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 27.05.23.
//

import UIKit

protocol UIKitProductCellProtocol {
    var itemName: String {get}
    var regularPriceText: String {get}
    var img: String {get}
}

class UIKitProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var regularPriceText: UILabel!
    @IBOutlet weak var itemName: UILabel!
 
    static let identifier = "UIKitProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(data: UIKitProductCellProtocol) {
        itemName.text = data.itemName
        regularPriceText.text = "\(data.regularPriceText) ₼"
        img.loadUrl(data.img)
    }
    
}
