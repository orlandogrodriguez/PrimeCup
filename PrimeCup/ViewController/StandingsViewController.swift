//
//  ViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class StandingsViewController: UITableViewController {
    
    var database = TeamPlayerDatabase()
    
    @IBOutlet var oStandingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        self.tabBarController?.navigationItem.title = "Standings"
        oStandingsTableView.tableFooterView = UIView()
        oStandingsTableView.reloadData()
    }
}

extension StandingsViewController: UINavigationControllerDelegate, UITabBarDelegate {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.teams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsCell") as! StandingsCell
        let sortedTeams = database.teams.sorted { (team1: Team, team2: Team) -> Bool in
            let team1Points = team1.points + team1.goalDifference
            let team2Points = team2.points + team2.goalDifference
            return team1Points > team2Points
        }
        cell.setDataForTeam(team: sortedTeams[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - Go to team page
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
}
