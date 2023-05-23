//
//  SecondCategoryViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import Foundation
struct SecondCategory {
    let title: String
}

class SecondCategoryViewModel {
    var tags = [Tags]()
    

    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getTags() {
        TagsNetworkManager.shared.getItemTags { tags, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallBack?(errorMessage)
            } else if let tags = tags {
                self.tags = tags
                self.successCallBack?()
            }
        }
    }
}
