//
//  SelectAwayTeamViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/4/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class SelectAwayTeamViewController: UIViewController {

    var database: TeamPlayerDatabase?
    var homeTeam: Team?
    var awayTeam: Team?
    
    @IBOutlet weak var oFCPrimeButton: UIButton!
    @IBOutlet weak var oCroquetasUnitedButton: UIButton!
    @IBOutlet weak var oSticksFCButton: UIButton!
    @IBOutlet weak var oPowerPuffSquadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableHomeTeam()
    }
    
    func disableHomeTeam() {
        guard let homeTeam = homeTeam else { return }
        switch homeTeam.teamName {
        case "FC Prime":
            oFCPrimeButton.alpha = 0.5
            oFCPrimeButton.isEnabled = false
        case "Croquetas Utd.":
            oCroquetasUnitedButton.alpha = 0.5
            oCroquetasUnitedButton.isEnabled = false
        case "Sticks FC":
            oSticksFCButton.alpha = 0.5
            oSticksFCButton.isEnabled = false
        case "PPS":
            oPowerPuffSquadButton.alpha = 0.5
            oPowerPuffSquadButton.isEnabled = false
        default:
            print("Something wrong with home team.")
        }
        
    }
    
    func goToSetScoreVC() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "setScoreVC") as! SetScoreViewController
        nextVC.database = self.database
        nextVC.homeTeam = self.homeTeam
        nextVC.awayTeam = self.awayTeam
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func handleFCPrimeSelected(_ sender: UIButton) {
        guard let database = database else { return }
        awayTeam = database.teams[0]
        goToSetScoreVC()
    }
    
    @IBAction func handleCroquetasUnitedSelected(_ sender: UIButton) {
        guard let database = database else { return }
        awayTeam = database.teams[1]
        goToSetScoreVC()
    }
    
    @IBAction func handleSticksFCSelected(_ sender: UIButton) {
        guard let database = database else { return }
        awayTeam = database.teams[2]
        goToSetScoreVC()
    }
    
    @IBAction func handlePowerPuffSquadSelected(_ sender: UIButton) {
        guard let database = database else { return }
        awayTeam = database.teams[3]
        goToSetScoreVC()
    }
    
    
}
