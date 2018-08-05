//
//  AdminLoginViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/3/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class AdminLoginViewController: UIViewController {

    var database: TeamPlayerDatabase = TeamPlayerDatabase()
    
    @IBOutlet weak var oUsernameTextField: UITextField!
    @IBOutlet weak var oPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        guard let email = oUsernameTextField.text,
              let password = oPasswordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard user != nil else { return }
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "adminHomeVC") as! AdminHomeViewController
            nextVC.database = self.database
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    

}
