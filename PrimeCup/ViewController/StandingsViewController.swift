//
//  ViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class StandingsViewController: UITableViewController {
    
    var database = TeamPlayerDatabase()
    var teams: [Team] = []
    
    @IBOutlet var oStandingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teams = database.teams.sorted { (team1: Team, team2: Team) -> Bool in
            let team1Points = team1.points + team1.goalDifference
            let team2Points = team2.points + team2.goalDifference
            return team1Points > team2Points
        }
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        self.tabBarController?.navigationItem.title = "Standings"
        oStandingsTableView.tableFooterView = UIView()
        oStandingsTableView.reloadData()
    }
    
    func goToAdminLoginVC() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "adminLoginVC") as! AdminLoginViewController
        nextVC.database = self.database
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension StandingsViewController: UINavigationControllerDelegate, UITabBarDelegate {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.teams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsCell") as! StandingsCell
        cell.setDataForTeam(team: teams[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "teamVC") as! TeamViewController
        nextVC.team = teams[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
    

}
