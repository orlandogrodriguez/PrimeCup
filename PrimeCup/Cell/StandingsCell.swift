//
//  StandingsCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class StandingsCell: UITableViewCell {
    
    
    
    @IBOutlet weak var oTeamLogoImageView: UIImageView!
    @IBOutlet weak var oTeamNameLabel: UILabel!
    @IBOutlet weak var oPointsLabel: UILabel!
    @IBOutlet weak var oGamesPlayedLabel: UILabel!
    @IBOutlet weak var oGamesWonLabel: UILabel!
    @IBOutlet weak var oGamesTiedLabel: UILabel!
    @IBOutlet weak var oGamesLostLabel: UILabel!
    @IBOutlet weak var oGoalDifferenceLabel: UILabel!
    
    func setDataForTeam(team: Team) {
        setTeamName(teamName: team.teamName)
        setTeamLogo(teamLogo: team.teamLogo!)
        setPoints(points: team.points)
        setGamesPlayed(gamesPlayed: team.gamesPlayed)
        setGamesWon(gamesWon: team.gamesWon)
        setGamesTied(gamesTied: team.gamesTied)
        setGamesLost(gamesLost: team.gamesLost)
        setGoalDifference(goalDifference: team.goalDifference)
    }
    
    func setTeamName(teamName: String) {
        oTeamNameLabel.text = teamName
    }
    
    func setTeamLogo(teamLogo: UIImage) {
        oTeamLogoImageView.image = teamLogo
    }
    
    func setPoints(points: Int) {
        oPointsLabel.text = String(points)
    }
    
    func setGamesPlayed(gamesPlayed: Int) {
        oGamesPlayedLabel.text = String(gamesPlayed)
    }
    
    func setGamesWon(gamesWon: Int) {
        oGamesWonLabel.text = String(gamesWon)
    }
    
    func setGamesTied(gamesTied: Int) {
        oGamesTiedLabel.text = String(gamesTied)
    }
    
    func setGamesLost(gamesLost: Int) {
        oGamesLostLabel.text = String(gamesLost)
    }
    
    func setGoalDifference(goalDifference: Int) {
        oGoalDifferenceLabel.text = String(goalDifference)
    }
}
