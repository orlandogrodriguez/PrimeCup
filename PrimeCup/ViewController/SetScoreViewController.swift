//
//  SetScoreViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/4/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SetScoreViewController: UIViewController {

    var database: TeamPlayerDatabase?
    var homeTeam: Team?
    var awayTeam: Team?
    var match: Match?
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var oHomeScorersStackView: UIStackView!
    @IBOutlet weak var oAwayScorersStackView: UIStackView!
    
    @IBOutlet weak var oHomeTeamLogoImageView: UIImageView!
    @IBOutlet weak var oAwayTeamLogoImageView: UIImageView!
    
    @IBOutlet weak var oHomeScoreLabel: UILabel!
    @IBOutlet weak var oAwayScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        guard let homeTeam = homeTeam,
              let awayTeam = awayTeam,
              let database = database else { return }
        match = Match(teams: (homeTeam, awayTeam), score: (0, 0))
        oHomeTeamLogoImageView.image = homeTeam.teamLogo
        oAwayTeamLogoImageView.image = awayTeam.teamLogo
    }
    
    func addGoal(goal: Goal) {
        match?.goals.append(goal)
        if goal.scorer?.team == homeTeam!.teamName {
            addGoalForHomeTeam(goal: goal)
        } else if goal.scorer?.team == awayTeam!.teamName {
            addGoalForAwayTeam(goal: goal)
        } else {
            print("There was an issue adding goal.")
        }
    }
    
    func addGoalForHomeTeam(goal: Goal) {
        let scorerLabel = UILabel()
        scorerLabel.text =   goal.scorer?.name
        oHomeScorersStackView.addArrangedSubview(scorerLabel)
        updateViewFromModel()
    }
    
    func addGoalForAwayTeam(goal: Goal) {
        let scorerLabel = UILabel()
        scorerLabel.text =   goal.scorer?.name
        oAwayScorersStackView.addArrangedSubview(scorerLabel)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        oHomeScoreLabel.text = String(match!.score.0)
        oAwayScoreLabel.text = String(match!.score.1)
    }
    
    @IBAction func goToAddGoalForHomeTeam(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectScorerVC") as! SelectScorerViewController
        nextVC.playerTeam = homeTeam
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func goToAddGoalForAwayTeam(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectScorerVC") as! SelectScorerViewController
        nextVC.playerTeam = awayTeam
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func handleSubmitMatch(_ sender: UIButton) {
        
        guard let match = match else {
            print("Something wrong with match.")
            return
        }
        
        let newMatchRef = self.ref.child("matches").childByAutoId()
        newMatchRef.setValue(["home_team": self.homeTeam!.teamName,
                              "away_team": self.awayTeam!.teamName,
                             "home_score": self.match!.score.0,
                             "away_score": self.match!.score.1])
        
        for goal in match.goals {
            let goalRef = newMatchRef.child("goals").childByAutoId()
            goalRef.setValue(["scorer": goal.scorer?.name,
                              "assist": goal.assist?.name,
                              "team": goal.scorer?.team])
        }
    
        let alert = UIAlertController(title: "Match Created Successfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.goToAdminHomeVC()
        }))
        self.present(alert, animated: true)
        
    }
    
    @IBAction func handleCancelMatch(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure you want to cancel this match?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            self.goToAdminHomeVC()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func goToAdminHomeVC() {
        let vcCount = self.navigationController?.viewControllers.count
        let adminHomeVC = self.navigationController?.viewControllers[vcCount! - 4]
        self.navigationController?.popToViewController(adminHomeVC!, animated: true)
    }
    
}
