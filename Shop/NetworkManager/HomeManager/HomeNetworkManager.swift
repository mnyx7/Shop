//
//  HomeNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
class HomeNetworkManager {
    static let shared = HomeNetworkManager()
    
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
    func getProductCategories(complete: @escaping(([Categories]?, String?)->())) {
        NetworkManager.shared.request(model: [Categories].self,
                                      url: HomeEndpoint.categories.path,
                                      complete: complete)
    }
}
