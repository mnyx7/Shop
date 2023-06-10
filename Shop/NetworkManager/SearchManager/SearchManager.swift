//
//  SearchManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 07.06.23.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()

    func getSearchItems(text: String, complete: @escaping (([Product]?, String?) -> ())) {
        let url = HelperNetworkManager.shared.searchURLConfig(path: SearchEndpoint.search.rawValue, searchText: text)
        NetworkManager.shared.request(model: [Product].self,
                                      url: url,
                                      complete: complete)
        
    }
}
