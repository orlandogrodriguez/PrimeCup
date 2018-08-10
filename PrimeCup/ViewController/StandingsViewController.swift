//
//  ViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class StandingsViewController: UITableViewController {
    
    var database = TeamPlayerDatabase()
    var teams: [Team] = []
    
    var ref: DatabaseReference?
    
    @IBOutlet var oStandingsTableView: UITableView!
    
    private var refresher: UIRefreshControl = UIRefreshControl()
    private var loadingSpinnerView: UIView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(updateViewFromModel), for: .valueChanged)
        self.oStandingsTableView.refreshControl = refresher
        self.tabBarController?.navigationItem.title = "Standings"
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teams = database.teams.sorted { (team1: Team, team2: Team) -> Bool in
            let team1Points = team1.points + team1.goalDifference
            let team2Points = team2.points + team2.goalDifference
            return team1Points > team2Points
        }
        
        handleDatabaseUpdates { (finished) in
            if finished {
                self.updateViewFromModel()
                
            } else {
                print("No update needed.")
            }
            print("ending refresh")
            self.refresher.endRefreshing()
            if self.loadingSpinnerView != nil {
                UIViewController.removeSpinner(spinner: self.loadingSpinnerView!)
            }
            self.teams = self.database.teams.sorted { (team1: Team, team2: Team) -> Bool in
                let team1Points = team1.points + team1.goalDifference
                let team2Points = team2.points + team2.goalDifference
                return team1Points > team2Points
            }
            self.updateViewFromModel()
        }
        updateViewFromModel()
    }
    
    func handleDatabaseUpdates(completion: @escaping (Bool) -> ()) {
        ref = Database.database().reference()
        guard let dbref = ref else { return }
        
        dbref.child("matches").observe(DataEventType.value) { (snapshot) in
            self.database.matches = []
            self.database.resetTeams()
            guard let data = snapshot.value as? NSDictionary else {
                print("error getting data")
                completion(false)
                return
            }
            
            for dat in data {
                let datInfo = dat.value as! NSDictionary
                print("dat info: \(datInfo)")
                let awayTeam = datInfo["away_team"] as! String
                let homeTeam = datInfo["home_team"] as! String
                let awayScore = datInfo["away_score"] as! Int
                let homeScore = datInfo["home_score"] as! Int
                var goals: [Goal] = []
                if datInfo["goals"] != nil {
                    let goalsJSON = datInfo["goals"] as! NSDictionary
                    for gl in goalsJSON {
                        let goalInfo = gl.value as! NSDictionary
                        let goalScorerString = goalInfo["scorer"] as! String
                        let goalAssistString = goalInfo["assist"] as! String
                        let goalTeamString = goalInfo["team"] as! String
                        var goal = Goal()
                        for player in self.database.players {
                            if goalScorerString == player.name {
                                player.goals += 1
                                goal.scorer = player
                            }
                            if goalAssistString == player.name {
                                player.assists += 1
                                goal.assist = player
                            }
                        }
                        goals.append(goal)
                    }
                }
                
                var homeTeamTeam: Team?
                var awayTeamTeam: Team?
                
                for team in self.database.teams {
                    if team.teamName == homeTeam {
                        homeTeamTeam = team
                    }
                    if team.teamName == awayTeam {
                        awayTeamTeam = team
                    }
                }
                
                let newMatch = Match(teams: (homeTeamTeam!, awayTeamTeam!), score: (homeScore, awayScore), goals: goals)
                self.database.matches.append(newMatch)
                // self.matches = self.database.matches
                print("added new match. updating view.")
                completion(true)
            }
            
        }
        
    }
    
    @objc func updateViewFromModel() {
        self.refresher.beginRefreshing()
        self.tabBarController?.navigationItem.title = "Standings"
        oStandingsTableView.tableFooterView = UIView()
        oStandingsTableView.reloadData()
        self.refresher.endRefreshing()
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
