//
//  HomeCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import UIKit
protocol HomeCellProtocol {
    var categoryName: String { get }
    var imageUrl: String { get }
}
class HomeCell: UICollectionViewCell {
    var productsList: [Product] = [Product]()
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(data: HomeCellProtocol) {
        categoryName.text = data.categoryName
        img.loadUrl(data.imageUrl)
    }

}
