//
//  RegisterViewController.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/19/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: usernameTextfield.text!, password: passwordTextfield.text!) { (user, error) in
                                    
            if error != nil {
                print(error)
            } else {
                print("Registration successfull!")
            
            }
            self.register()
            SVProgressHUD.dismiss()
        }
    }
    
    func register() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let registerVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else {
            fatalError("Couldn't load RegisterViewController")
        }
        show(registerVC, sender: self)
    }
}
