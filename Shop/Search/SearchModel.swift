//
//  SearchModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 07.06.23.
//

import Foundation

// MARK: - SerachProduct
struct Search: Codable {
    let id: Int?
    let name, slug: String?
    let permalink: String?
    let dateCreated, dateCreatedGmt, dateModified, dateModifiedGmt: String?
    let type, status: String?
    let featured: Bool?
    let catalogVisibility, description, shortDescription, sku: String?
    let price, regularPrice, salePrice: String?
    let dateOnSaleFrom, dateOnSaleFromGmt, dateOnSaleTo, dateOnSaleToGmt: JSONNull?
    let onSale, purchasable: Bool?
    let totalSales: Int?
    let virtual, downloadable: Bool?
    let downloads: [JSONAny]?
    let downloadLimit, downloadExpiry: Int?
    let externalURL: String?
    let buttonText, taxStatus, taxClass: String?
    let manageStock: Bool?
    let stockQuantity: JSONNull?
    let backorders: String?
    let backordersAllowed, backordered: Bool?
    let lowStockAmount: JSONNull?
    let soldIndividually: Bool?
    let weight: String?
    let dimensions: Dimensions?
    let shippingRequired, shippingTaxable: Bool?
    let shippingClass: String?
    let shippingClassID: Int?
    let reviewsAllowed: Bool?
    let averageRating: String?
    let ratingCount: Int?
    let upsellIDS, crossSellIDS: [JSONAny]?
    let parentID: Int?
    let purchaseNote: String?
    let categories, tags: [Category]?
    let images: [Image]?
    let attributes, defaultAttributes, variations, groupedProducts: [JSONAny]?
    let menuOrder: Int?
    let priceHTML: String?
    let relatedIDS: [Int]?
    let metaData: [MetaDatum]?
    let stockStatus: String?
    let hasOptions: Bool?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, permalink
        case dateCreated
        case dateCreatedGmt
        case dateModified
        case dateModifiedGmt
        case type, status, featured
        case catalogVisibility
        case description
        case shortDescription
        case sku, price
        case regularPrice
        case salePrice
        case dateOnSaleFrom
        case dateOnSaleFromGmt
        case dateOnSaleTo
        case dateOnSaleToGmt
        case onSale
        case purchasable
        case totalSales
        case virtual, downloadable, downloads
        case downloadLimit
        case downloadExpiry
        case externalURL
        case buttonText
        case taxStatus
        case taxClass
        case manageStock
        case stockQuantity
        case backorders
        case backordersAllowed
        case backordered
        case lowStockAmount
        case soldIndividually
        case weight, dimensions
        case shippingRequired
        case shippingTaxable
        case shippingClass
        case shippingClassID
        case reviewsAllowed
        case averageRating
        case ratingCount
        case upsellIDS
        case crossSellIDS
        case parentID
        case purchaseNote
        case categories, tags, images, attributes
        case defaultAttributes
        case variations
        case groupedProducts
        case menuOrder
        case priceHTML
        case relatedIDS
        case metaData
        case stockStatus
        case hasOptions
        case links
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let length, width, height: String?
}

// MARK: - Image
struct Image: Codable {
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
struct Links: Codable {
    let linksSelf, collection: [Collection]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection
    }
}

// MARK: - Collection
struct Collection: Codable {
    let href: String?
}

// MARK: - MetaDatum
struct MetaDatum: Codable {
    let id: Int?
    let key, value: String?
}

typealias SerachProducts = [SerachProduct]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
