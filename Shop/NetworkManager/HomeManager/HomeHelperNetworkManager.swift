//
//  HomeHelperNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation

enum HomeItems: String {
    case products = "products?"
}

enum HomeItemsCategory: String {
    case categories = "products/categories?"
}


enum HomeEndpoint: String {
    case products = "products"
    case categories = "products/categories"
    var path: String {
        HelperNetworkManager.shared.URLconfig(path: self.rawValue)
    }
}
