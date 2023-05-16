//
//  UIImageView + Extension.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String) {
        let posterBaseURL = ""
        if let url = URL(string: posterBaseURL + posterPath) {
            self.sd_setImage(with: url)
        }
    }
}
