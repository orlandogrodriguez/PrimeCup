//
//  HistoryCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var match: Match?
    
    @IBOutlet weak var oHomeTeamLogoImageView: UIImageView!
    @IBOutlet weak var oHomeTeamNameLabel: UILabel!
    @IBOutlet weak var oHomeTeamScoreLabel: UILabel!
    @IBOutlet weak var oAwayTeamScoreLabel: UILabel!
    @IBOutlet weak var oAwayTeamLogoImageView: UIImageView!
    @IBOutlet weak var oAwayTeamNameLabel: UILabel!
    
    func setMatch(match: Match) {
        self.match = match
        oHomeTeamNameLabel.text = match.teams.0.teamName
        oHomeTeamLogoImageView.image = match.teams.0.teamLogo
        oHomeTeamScoreLabel.text = String(match.score.0)
        
        oAwayTeamNameLabel.text = match.teams.1.teamName
        oAwayTeamLogoImageView.image = match.teams.1.teamLogo
        oAwayTeamScoreLabel.text = String(match.score.1)
    }
}
