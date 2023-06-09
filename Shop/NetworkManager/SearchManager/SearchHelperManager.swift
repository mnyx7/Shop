//
//  SearchHelperManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 07.06.23.
//

import Foundation
enum SearchEndpoint: String {
    case search = "search/v2/articlesearch.json"
    
    var path: String {
        HelperNetworkManager.shared.URLconfig(path: self.rawValue)
    }
}
