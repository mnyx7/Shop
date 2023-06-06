// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Categories: Codable, HomeCellProtocol {
    var categoryName: String {
        name ?? ""
    }
  
    
    var imageUrl: String {
        image?.src ?? ""
        //links?.linksSelf?.first?.href ?? ""
    }
    
    let id: Int?
    let name, slug: String?
    let parent: Int?
    let description, display: String?
    let image: CategoryImage?
    let menuOrder, count: Int?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, parent, description, display
        case image
        case menuOrder
        case count
        case links
    }
}

// MARK: - CategoryImage
struct CategoryImage: Codable {
    let id: Int?
    let dateCreated, dateCreatedGmt, dateModified, dateModifiedGmt: String?
    let src: String?
    let name, alt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated
        case dateCreatedGmt
        case dateModified
        case dateModifiedGmt
        case src, name, alt
    }
}

// MARK: - Links
struct LinksCategories: Codable {
    let linksSelf, collection, up: [Collection]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection, up
    }
}

// MARK: - Collection
struct CollectionCategories: Codable {
    let href: String?
}
