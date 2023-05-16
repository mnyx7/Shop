//
//  HomeCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import UIKit
protocol HomeCellProtocol {
    var titleText: String { get }
    var imageUrl: String { get }
}
class HomeCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(data: HomeCellProtocol) {
        label.text = data.titleText
        img.loadUrl(data.imageUrl)
    }

}
