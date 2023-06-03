//
//  ProductsViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 23.05.23.
//

import UIKit

protocol ProductCellProtocol {
    var label: String {get}
    var price: String {get}
    var img: String {get}
}

class ProductsViewCell: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: ProductCellProtocol) {
        label.text = data.label
        price.text = data.price
        img.loadUrl(data.img)
    }

}
