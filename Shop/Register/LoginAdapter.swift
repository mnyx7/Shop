//
//  LoginAdapter.swift
//  Shop
//
//  Created by Minaya Yagubova on 09.08.23.
//

import Foundation
import GoogleSignIn

enum LoginType {
    case google
    case facebook
    case apple
}

class LoginAdapter {
//    var controller = LoginController()
    var controller: LoginViewController
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
    
    func userLogin(type: LoginType, complete: @escaping((User?, String?)->())) {
        switch type {
        case .google:
            googleLogin(complete: complete)
        case .facebook:
            facebookLogin(complete: complete)
        case .apple:
            appleLogin(complete: complete)
        }
    }
    
    private func googleLogin(complete: @escaping((User?, String?)->())) {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                complete(nil, error.localizedDescription)
            } else if let result = result{
                print(result.user.profile?.email ?? "")
                 let user = User(firstName: result.user.profile?.name ?? "",
                                 lastName: result.user.profile?.familyName ?? "",
                                 email: result.user.profile?.email ?? "",
                                 password: "")
                complete(user, nil)
            }
        }
    }
    
    private func facebookLogin(complete: @escaping((User?, String?)->())) {
        
    }
    
    private func appleLogin(complete: @escaping((User?, String?)->())) {
        
    }
}

