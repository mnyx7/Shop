//
//  File.swift
//  Shop
//
//  Created by Minaya Yagubova on 23.05.23.
//

import Foundation

class ProductsNetworkManager {
    static let shared = ProductsNetworkManager()
    
    func getProductItems(category: HomeItems,
                         complete: @escaping(([Product]?, String?)->())) {
        var url = ""
        switch category {
        case .products:
            url = HomeEndpoint.products.path
            
        }
        NetworkManager.shared.request(model: [Product].self,
                                      url: url,
                                      complete: complete)
    }
    
}
