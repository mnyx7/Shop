import Foundation

// MARK: - WelcomeElement
struct Product: Codable, HomeCellProtocol {
    let id: Int?
    let name, slug: String?
    let permalink: String?
    let dateCreated, dateCreatedGmt: DateCreated?
    let dateModified, dateModifiedGmt: String?
    let type: TypeEnum?
    let status: Status?
    let featured: Bool?
    let catalogVisibility: CatalogVisibility?
    let description, shortDescription, sku, price: String?
    let regularPrice, salePrice: String?
//    let dateOnSaleFrom, dateOnSaleFromGmt, dateOnSaleTo, dateOnSaleToGmt: JSONNull?
    let onSale, purchasable: Bool?
    let totalSales: Int?
    let virtual, downloadable: Bool?
    let downloads: [Download]?
    let downloadLimit, downloadExpiry: Int?
    let externalURL: String?
    let buttonText: ButtonText?
    let taxStatus: TaxStatus?
    let taxClass: String?
    let manageStock: Bool?
//    let stockQuantity: JSONNull?
    let backorders: Backorders?
    let backordersAllowed, backordered: Bool?
//    let lowStockAmount: JSONNull?
    let soldIndividually: Bool?
    let weight: String?
    let dimensions: Dimensions?
    let shippingRequired, shippingTaxable: Bool?
    let shippingClass: String?
    let shippingClassID: Int?
    let reviewsAllowed: Bool?
    let averageRating: String?
    let ratingCount: Int?
//    let upsellIDS, crossSellIDS: [JSONAny]?
    let parentID: Int?
    let purchaseNote: String?
    let categories: [Category]?
//    let tags: [JSONAny]?
    let images: [Image]?
    let attributes: [Attribute]?
//    let defaultAttributes, variations: [JSONAny]?
    let groupedProducts: [Int]?
    let menuOrder: Int?
    let priceHTML: String?
    let relatedIDS: [Int]?
    let metaData: [MetaDatum]?
    let stockStatus: StockStatus?
    let hasOptions: Bool?
    let links: Links?
    
    var imageUrl: String {
        images?.first?.src ?? ""
    }
    
    var titleText: String {
        name ?? ""
    }
    
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
//        case dateOnSaleFrom
//        case dateOnSaleFromGmt
//        case dateOnSaleTo
//        case dateOnSaleToGmt
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
//        case stockQuantity
        case backorders
        case backordersAllowed
        case backordered
//        case lowStockAmount
        case soldIndividually
        case weight, dimensions
        case shippingRequired
        case shippingTaxable
        case shippingClass
        case shippingClassID
        case reviewsAllowed
        case averageRating
        case ratingCount
//        case upsellIDS
//        case crossSellIDS
        case parentID
        case purchaseNote
        case categories, images, attributes
//        case tags
//        case defaultAttributes
//        case variations
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

// MARK: - Attribute
struct Attribute: Codable {
    let id: Int?
    let name: String?
    let position: Int?
    let visible, variation: Bool?
    let options: [String]?
}

enum Backorders: String, Codable {
    case no = "no"
}

enum ButtonText: String, Codable {
    case buyOnTheWordPressSwagStore = "Buy on the WordPress swag store!"
    case empty = ""
}

enum CatalogVisibility: String, Codable {
    case hidden = "hidden"
    case visible = "visible"
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name, slug: String?
}

enum DateCreated: String, Codable {
    case the20230513T130654 = "2023-05-13T13:06:54"
    case the20230513T130655 = "2023-05-13T13:06:55"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let length, width, height: String?
}

// MARK: - Download
struct Download: Codable {
    let id, name: String?
    let file: String?
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
    let key: Key?
    let value: String?
}

enum Key: String, Codable {
    case wpcomIsMarkdown = "_wpcom_is_markdown"
}

enum Status: String, Codable {
    case publish = "publish"
}

enum StockStatus: String, Codable {
    case instock = "instock"
}

enum TaxStatus: String, Codable {
    case taxable = "taxable"
}

enum TypeEnum: String, Codable {
    case external = "external"
    case grouped = "grouped"
    case simple = "simple"
}
