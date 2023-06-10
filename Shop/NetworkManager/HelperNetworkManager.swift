//
//  HelperNetworkManager.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
class HelperNetworkManager {
    static let shared = HelperNetworkManager()
    
    private let baseURL = "https://bytyki.com/wp-json/wc/v3/"
    private let consumerKey = "ck_0415acdacc56ee008d2d9cc89a91b486770db423"
    private let consumerSecret = "cs_92a39ed89e1aacb0901de1ef29da0e735e5ff792"
    
    func URLconfig(path: String) -> String {
        baseURL + path + "?consumer_key=\(consumerKey)&" + "consumer_secret=\(consumerSecret)"
    }
    
    func searchURLConfig(path: String, searchText: String) -> String {
        baseURL + path + "=" + searchText + "&consumer_key=\(consumerKey)&" + "consumer_secret=\(consumerSecret)"
    }
}
