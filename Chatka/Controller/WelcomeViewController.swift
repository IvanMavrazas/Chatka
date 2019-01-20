//
//  ViewController.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/16/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("couldn't find LoginViewController")
        }
        show(loginVC, sender: self)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            fatalError("couldn't find RegisterViewController")
        }
        show(loginVC, sender: self)
    }
    
}

