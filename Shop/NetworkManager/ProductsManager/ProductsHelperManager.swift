//
//  ProductsHelperManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 23.05.23.
//

import Foundation

enum ProductsEndpoint: String {
    case products = "products"
    var path: String {
        HelperNetworkManager.shared.URLconfig(path: self.rawValue)
    }
}
