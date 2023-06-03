//
//  leftLabelRightIconTableViewCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import UIKit

protocol SecondCategoryCellProtocol {
    var label: String { get }
}

class leftLabelRightIconTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(data: SecondCategoryCellProtocol) {
        label.text = data.label
    }
    
}
