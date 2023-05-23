//
//  ProductsViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 23.05.23.
//

import Foundation

struct Products {
    let title: String
    let products: [Product]
}

class ProductsViewModel {
    var products = [Product]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getProductItems() {
        ProductsNetworkManager.shared.getProductItems(category: .products) { products, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let products = products {
                self.products = products
                self.successCallBack?()
            }
        }
    }
}
