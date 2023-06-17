//
//  HomeViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.
//

import Foundation
struct Items {
    let title: String
    let items: [Product]
}

struct ProductAndCategoryList {
    var id: Int = 0
    var name: String = ""
    var slug: String = ""
    var productByCatList: [Product] = [Product]()
    
}

class HomeViewModel {
    var categoryProductList: [ProductAndCategoryList] = [ProductAndCategoryList]()

    var categories = [Categories]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getItems() {
        HomeNetworkManager.shared.getProductCategories { categories, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let items = categories {
                self.categories = items
//                self.getProductItems()
                self.successCallBack?()
            }
        }
    }
    
    func getProductItems() {
        ProductsNetworkManager.shared.getProductItems(category: .products) { products, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let products = products {
                self.injectDetails(productList: products)

               // self.products = products
                self.successCallBack?()
            }
        }
    }
    
    func injectDetails(productList: [Product]) {
        
        
        
        var productAndCategory: ProductAndCategoryList = ProductAndCategoryList()
        productAndCategory.name = productList.first?.categories?.first?.name ?? ""
        productAndCategory.id = productList.first?.categories?.first?.id ?? 0
        productAndCategory.slug = productList.first?.categories?.first?.slug ?? ""
        
        productAndCategory.productByCatList.append(contentsOf: productList)
        categoryProductList.append(productAndCategory)
        
    }
    

}
