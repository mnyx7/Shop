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
    var tags = [Tags]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getProductItems() {
        ProductsNetworkManager.shared.getProductItems(category: .products) { products, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let products = products {
                //self.injectDetails(productList: products)
                
                self.products = products
                self.successCallBack?()
            }
        }
    }
    
    
    
    func getTags() {
        TagsNetworkManager.shared.getItemTags { tags, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let tags = tags {
                self.tags = tags
                self.successCallBack?()
            }
        }
    }
    
}
