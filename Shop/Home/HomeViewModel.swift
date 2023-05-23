//
//  HomeViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
struct Items {
    let title: String
    let items: [Product]
}

class HomeViewModel {
    
    var categories = [Categories]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getItems() {
        HomeNetworkManager.shared.getProductCategories { categories, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let items = categories {
                self.categories = items
                self.successCallBack?()
            }
        }
    }
    

}
