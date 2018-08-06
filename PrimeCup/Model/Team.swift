//
//  TeamModel.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class Team: NSObject {
    
    // Properties
    var teamName: String
    var teamMembers: [Player]
    var points: Int = 0
    var gamesPlayed: Int = 0
    var gamesWon: Int = 0
    var gamesTied: Int = 0
    var gamesLost: Int = 0
    var goalDifference: Int = 0
    var teamLogo: UIImage?
    
    init(teamName: String, teamLogo: UIImage, teamMembers: [Player]) {
        self.teamName = teamName
        self.teamMembers = teamMembers
        self.teamLogo = teamLogo
        self.points = 0
        self.gamesPlayed = 0
        self.gamesWon = 0
        self.gamesTied = 0
        self.gamesLost = 0
        self.goalDifference = 0
    }
    
    func addPlayer(player: Player) {
        teamMembers.append(player)
    }
    
}
