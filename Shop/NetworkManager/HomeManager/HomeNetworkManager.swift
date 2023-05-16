//
//  HomeNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
class HomeNetworkManager {
    static let shared = HomeNetworkManager()
    
    func getProductItems(category: HomeCategory, complete: @escaping(([Product]?, String?)->())) {
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
