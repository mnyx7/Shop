//
//  SearchViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 07.06.23.
//

import Foundation

class SearchViewModel {
    var product = [Product]()
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?

    
    func getProductItems() {
        ProductsNetworkManager.shared.getProductItems(category: .products) { products, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let products = products {
                self.product = products
                self.successCallBack?()
            }
        }
    }
    func getSearch(text: String) {
        SearchManager.shared.getSearchItems(text: text) { searchData, error in
            if let error = error {
                print( error)
            } else if let searchData = searchData {
                self.product = searchData
                self.successCallBack?()
            }
        }
    }
    
    func resetDatas() {
  //      item = nil
        product.removeAll()
    }
}
