//
//  OnboardingCell.swift
//  Shop
//
//  Created by Minaya Yagubova on 08.08.23.
//

import UIKit

class OnboardingCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textSlider: UILabel!
    @IBOutlet weak var titleSlider: UILabel!
    @IBOutlet weak var imgSlider: UIImageView!
    static let identifier = String(describing: OnboardingViewController.self)
    
   
    
//    func setup (_ slide: OnboardingSlide){
//        titleSlider.text = slide.title
//        textSlider.text = slide.text
//        imgSlider.image = slide.image
//    }
}

