//
//  Match.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation

class Match: NSObject {
    var teams: (Team, Team)
    var winner: Team? {
        didSet {
            winner!.points += 3
            winner!.gamesWon += 1
            winner!.goalDifference += abs(score.0 - score.1)
        }
    }
    var loser: Team? {
        didSet {
            loser!.gamesLost += 1
            loser!.goalDifference -= abs(score.0 - score.1)
        }
    }
    var score: (Int, Int) = (0, 0)
    var goals: [Goal] = [] {
        didSet {
            print("Added goal")
            if goals.last?.scorer?.team == self.teams.0.teamName {
                score.0 += 1
            } else if goals.last?.scorer?.team == self.teams.1.teamName {
                score.1 += 1
            }
            goals.last?.scorer?.goals += 1
            goals.last?.assist?.assists += 1
        }
    }
    
    init(teams: (Team, Team), score: (Int, Int)) {
        self.teams = teams
        self.score = score
        teams.0.gamesPlayed += 1
        teams.1.gamesPlayed += 1
        if score.0 > score.1 {
            winner = teams.0
            loser = teams.1
        } else if score.0 < score.1 {
            winner = teams.1
            loser = teams.0
        } else {
            self.teams.0.gamesTied += 1
            self.teams.0.points += 1
            self.teams.1.gamesTied += 1
            self.teams.1.points += 1
        }
        guard let winner = winner,
            let loser = loser else { return }
        winner.points += 3
        winner.gamesWon += 1
        winner.goalDifference += abs(score.0 - score.1)
        loser.gamesLost += 1
        loser.goalDifference -= abs(score.0 - score.1)
    }
    
    convenience init(teams: (Team, Team), score: (Int, Int), goals: [Goal]) {
        self.init(teams: teams, score: score)
        self.goals = goals
    }

}
