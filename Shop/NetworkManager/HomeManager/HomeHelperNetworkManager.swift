//
//  HomeHelperNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation

enum HomeCategory: String {
    case products = "products?"
}

enum HomeEndpoint: String {
    case products = "products"
    var path: String {
        HelperNetworkManager.shared.URLconfig(path: self.rawValue)
    }
}
