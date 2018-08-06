//
//  MatchHistoryViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/31/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MatchHistoryViewController: UITableViewController {
    
    var database: TeamPlayerDatabase {
        get {
            return (self.tabBarController!.viewControllers![0] as! StandingsViewController).database
        }
        set {
            (self.tabBarController!.viewControllers![0] as! StandingsViewController).database = newValue
        }
    }
    
    private var refresher: UIRefreshControl = UIRefreshControl()
    private var loadingSpinnerView: UIView?
    
    var ref: DatabaseReference?
    
    @IBOutlet weak var oMatchHistoryTableView: UITableView!
    var matches: [Match]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(updateViewFromModel), for: .valueChanged)
        self.oMatchHistoryTableView.refreshControl = refresher
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matches = self.database.matches
        handleDatabaseUpdates { (finished) in
            if finished {
                self.updateViewFromModel()
                self.refresher.endRefreshing()
                UIViewController.removeSpinner(spinner: self.loadingSpinnerView!)
            } else {
                print("No update needed.")
            }
        }
        updateViewFromModel()
    }
    
    func handleDatabaseUpdates(completion: @escaping (Bool) -> ()) {
        ref = Database.database().reference()
        guard let dbref = ref else { return }
        
        dbref.child("matches").observe(DataEventType.value) { (snapshot) in
            self.database.matches = []
            self.matches = []
            self.database.resetTeams()
            guard let data = snapshot.value as? NSDictionary else {
                print("error getting data")
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
                self.matches = self.database.matches
                print("added new match. updating view.")
                self.updateViewFromModel()
            }
            
        }
    }
    
    @objc func updateViewFromModel() {
        self.refresher.beginRefreshing()
        self.tabBarController?.navigationItem.title = "Match History"
        oMatchHistoryTableView.tableFooterView = UIView()
        oMatchHistoryTableView.reloadData()
        self.refresher.endRefreshing()
    }
}

extension MatchHistoryViewController: UINavigationBarDelegate, UITabBarDelegate {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = HistoryCell()
        if let matches = matches {
            cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
            cell.setMatch(match: matches[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let matches = matches else { return 0 }
        return matches.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.5
    }
}

struct JSONMatch: Codable {
    let awayScore: Int
    let awayTeam: String
    let homeScore: Int
    let homeTeam: String
    let goals: JSONGoal?
}

struct JSONGoal: Codable {
    let assist: String
    let scorer: String
    let team: String
}
