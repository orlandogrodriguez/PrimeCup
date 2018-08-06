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
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        oUsernameTextField.layer.cornerRadius = 8
        oUsernameTextField.layer.masksToBounds = true
        oUsernameTextField.layoutIfNeeded()
        oPasswordTextField.layer.cornerRadius = 8
        oPasswordTextField.layer.masksToBounds = true
        oPasswordTextField.layoutIfNeeded()

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
