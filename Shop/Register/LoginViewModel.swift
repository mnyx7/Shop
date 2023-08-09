//
//  LoginViewModel.swift
//  Shop
//
//  Created by Minaya Yagubova on 09.08.23.
//

import Foundation

class LoginViewModel {
    var user: User?
    var loginAdapter: LoginAdapter?
    var databaseAdapter = DatabaseAdapter()
    
    func login(type: LoginType) {
        loginAdapter?.userLogin(type: type, complete: { user, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let user = user {
                self.user = user
                self.databaseAdapter.saveUserInfo(user: user) {
                    //success callback
                }
            }
        })
    }
}
