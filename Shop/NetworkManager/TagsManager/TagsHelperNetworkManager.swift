//
//  TagsHelperNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import Foundation
enum ItemTags: String {
    case tags = "products/tags"
}
enum ItemAttributes: String {
    case attributes = "products/attributes"
}

enum TagsEndpoint: String {
    case attributes = "products/attributes"
    case tags = "products/tags"
    var path: String {
        HelperNetworkManager.shared.URLconfig(path: self.rawValue)
    }
}
