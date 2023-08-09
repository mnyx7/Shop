//
//  RegisterViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 04.06.23.
//

import UIKit

class RegisterViewController: UIViewController {
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // viewModel.loginAdapter = LoginAdapter(controller: self)
    }
    
    @IBAction func appleSignup(_ sender: Any) {
        viewModel.login(type: .apple)

    }
    
    @IBAction func googleSignup(_ sender: Any) {
        viewModel.login(type: .google)

    }
    @IBAction func facebookSignup(_ sender: Any) {
        viewModel.login(type: .facebook)

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
