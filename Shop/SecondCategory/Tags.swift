//
//  Tags.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Tags: Codable, SecondCategoryCellProtocol{
    var btn: String {
        btn ?? ""
    }
    
    var label: String {
        label ?? ""
    }
    
    let id: Int?
    let name, slug, description: String?
    let count: Int?
    let links: TagLinks?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, description, count
        case links
    }
}

// MARK: - Links
struct TagLinks: Codable {
    let linksSelf, collection: [TagsCollection]?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection
    }
}

// MARK: - Collection
struct TagsCollection: Codable {
    let href: String?
}

typealias Welcome = [Tags]
