//
//  HomeNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
class HomeNetworkManager {
    static let shared = HomeNetworkManager()
    
 
    func getProductCategories(complete: @escaping(([Categories]?, String?)->())) {
        NetworkManager.shared.request(model: [Categories].self,
                                      url: HomeEndpoint.categories.path,
                                      complete: complete)
    }
}
