//
//  SelectHomeTeamViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/4/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class SelectHomeTeamViewController: UIViewController {
    
    var database: TeamPlayerDatabase?
    var homeTeam: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func goToSelectAwayTeamVC() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectAwayTeamVC") as! SelectAwayTeamViewController
        nextVC.database = self.database
        nextVC.homeTeam = self.homeTeam
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func handleFCPrimeSelected(_ sender: UIButton) {
        homeTeam = database!.teams[0]
        goToSelectAwayTeamVC()
    }
    
    @IBAction func handleCroquetasUnitedSelected(_ sender: UIButton) {
        homeTeam = database!.teams[1]
        goToSelectAwayTeamVC()
    }
    
    @IBAction func handleSticksFCSelected(_ sender: UIButton) {
        homeTeam = database!.teams[2]
        goToSelectAwayTeamVC()
    }
    
    @IBAction func handlePowerPuffSquadSelected(_ sender: UIButton) {
        homeTeam = database!.teams[3]
        goToSelectAwayTeamVC()
    }
    
    
}
