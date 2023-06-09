//
//  SearchViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 07.06.23.
//

import Foundation
class SearchViewModel {
  //  var item : Search?
    var search = [SearchResult]()
    var successCallback: (()->())?
    
    func getSearch(text: String) {
//        SearchManager.shared.getSearchItems(text: text) { searchData, error in
//            if let error = error {
//                print( error)
//            } else if let searchData = searchData {
//                self.search = searchData.response?.docs ?? []
//                self.successCallback?()
//            }
//        }
    }
    
    func resetDatas() {
  //      item = nil
        search.removeAll()
    }
}
