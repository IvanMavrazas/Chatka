//
//  LoginViewController.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/19/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
 
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        

    }
    
    func login() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else {
            fatalError("couldn't find LoginViewController")
        }
        show(loginVC, sender: self)
    }
}
