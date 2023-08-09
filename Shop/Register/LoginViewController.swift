//
//  LoginViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 23.05.23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func forgotPassword(_ sender: Any) {
    }
    @IBAction func signIn(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.present(signUpVC, animated: true)
    }

    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
