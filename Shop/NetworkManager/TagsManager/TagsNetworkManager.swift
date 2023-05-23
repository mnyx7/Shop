//
//  TagsNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import Foundation

import Foundation

class TagsNetworkManager {
    static let shared = TagsNetworkManager()
    
    func getTags(complete: @escaping(([Tags]?, String?)->())) {
        NetworkManager.shared.request(model: [Tags].self,
                                      url: TagsEndpoint.tags.path,
                                      complete: complete)
    }
    
    func getItemTags(complete: @escaping(([Tags]?, String?)->())) {
        NetworkManager.shared.request(model: [Tags].self,
                                      url: TagsEndpoint.tags.path,
                                      complete: complete)
    }
}
