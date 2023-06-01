//
//  UIKitProductCollectionViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 27.05.23.
//

import UIKit

protocol UIKitProductCellProtocol {
    var label: String {get}
    var price: String {get}
    var img: String {get}
}

class UIKitProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var price: UILabel!
    
    static let identifier = "UIKitProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "UIKitProductCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
        
    }
    
    func configure(data: UIKitProductCellProtocol) {
        label.text = data.label
        price.text = data.price
        img.loadUrl(data.img)
    }
    
}
