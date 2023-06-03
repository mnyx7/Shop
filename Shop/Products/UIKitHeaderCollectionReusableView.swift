//
//  UIKitHeaderCollectionReusableView.swift
//  Shop
//
//  Created by Minaya Yagubova on 27.05.23.
//

import UIKit

class UIKitHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "UIKitHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        //label.textColor = .white
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemGray
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
        
}
