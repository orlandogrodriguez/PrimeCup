//
//  AdminHomeViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/3/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class AdminHomeViewController: UIViewController {
    
    var database: TeamPlayerDatabase?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func back(sender: UIBarButtonItem) {
        let auth = Auth.auth()
        if auth.currentUser != nil {
            do {
                try auth.signOut()
                self.navigationController?.popViewController(animated: true)
                print("Admin signed out.")
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }

    @IBAction func handleAddMatch(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectHomeTeamVC") as! SelectHomeTeamViewController
        nextVC.database = self.database
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func handleReturnToHome(_ sender: UIButton) {
        let auth = Auth.auth()
        if auth.currentUser != nil {
            do {
                try auth.signOut()
                self.navigationController?.popViewController(animated: true)
                self.navigationController?.popViewController(animated: true)
                print("Admin signed out.")
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }
    
}
