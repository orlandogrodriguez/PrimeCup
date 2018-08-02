//
//  PlayerFactory.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class TeamPlayerDatabase: NSObject {
    
    var players: [Player] = []
    var teams: [Team] = []
    var matches: [Match] = []
    
    override init() {
        super.init()
        generateTeams()
        generatePlayers()
        generateMatches()
    }
    
    func generateTeams() {
        teams.append(Team(teamName: "FC Prime", teamLogo: #imageLiteral(resourceName: "fcprime"),teamMembers: []))
        teams.append(Team(teamName: "Croquetas Utd.", teamLogo: #imageLiteral(resourceName: "croquetasutd"),teamMembers: []))
        teams.append(Team(teamName: "Sticks FC", teamLogo: #imageLiteral(resourceName: "stickfc"),teamMembers: []))
        teams.append(Team(teamName: "PPS", teamLogo: #imageLiteral(resourceName: "pps"),teamMembers: []))
        
    }
    
    func generatePlayers() {
        //var statLabels = ["Pace", "Shooting", "Passing", "Dribbling", "Defense", "Strength"]
        //var gkStatLabels = ["Diving", "Handling", "Kicking", "Reflexes", "Speed", "Positioning"]
        // Orlando G. Rodriguez
        var player = Player(name: "Dito", dateOfBirth: "07-01-1994", age: 24, country: "USA", team: "FC Prime", position: "GK")
        player.updatePlayerStats(pace: 87, drib: 80, def: 78, str: 76, sho: 77, pas: 72)
        player.setPlayerImage(image: #imageLiteral(resourceName: "dito"))
        addToTeam(player: player)
        
        // Julian A. Rodriguez
        player = Player(name: "Juli", dateOfBirth: "08-01-1995", age: 23, country: "USA", team: "FC Prime", position: "LWB")
        player.updatePlayerStats(pace: 82, drib: 80, def: 83, str: 73, sho: 78, pas: 80)
        player.setPlayerImage(image: #imageLiteral(resourceName: "juli"))
        players.append(player)
        addToTeam(player: player)
        
        // Isabel L. Rodriguez
        player = Player(name: "Isabel", dateOfBirth: "04-01-1998", age: 20, country: "USA", team: "FC Prime", position: "CF")
        player.updatePlayerStats(pace: 68, drib: 67, def: 73, str: 65, sho: 74, pas: 69)
        players.append(player)
        addToTeam(player: player)
        
        // Luis A. Garcia
        player = Player(name: "Alejandro", dateOfBirth: "07-23-2000", age: 18, country: "Puerto Rico", team: "FC Prime", position: "CM")
        player.updatePlayerStats(pace: 72, drib: 82, def: 78, str: 81, sho: 81, pas: 84)
        players.append(player)
        addToTeam(player: player)
        
        // Sebatian Requena
        player = Player(name: "Sebastian", dateOfBirth: "01-02-1996", age: 22, country: "USA", team: "FC Prime", position: "CDM")
        player.updatePlayerStats(pace: 79, drib: 87, def: 86, str: 84, sho: 87, pas: 90)
        players.append(player)
        addToTeam(player: player)
        
        // Monti
        //var statLabels = ["Pace", "Shooting", "Passing", "Dribbling", "Defense", "Strength"]
        //var gkStatLabels = ["Diving", "Handling", "Kicking", "Reflexes", "Speed", "Positioning"]
        player = Player(name: "Monti", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Croquetas Utd.", position: "GK")
        player.updatePlayerStats(pace: 83, drib: 90, def: 80, str: 81, sho: 79, pas: 86)
        players.append(player)
        addToTeam(player: player)
        
        // Javier Deya
        player = Player(name: "Javi", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "RW")
        player.updatePlayerStats(pace: 97, drib: 87, def: 80, str: 81, sho: 84, pas: 82)
        players.append(player)
        addToTeam(player: player)
        
        // Andy
        player = Player(name: "Andy", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "LW")
        player.updatePlayerStats(pace: 75, drib: 76, def: 79, str: 72, sho: 78, pas: 74)
        players.append(player)
        addToTeam(player: player)
        
        // Jose Irizzarri
        player = Player(name: "Irizarri", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "LB")
        player.updatePlayerStats(pace: 74, drib: 75, def: 84, str: 82, sho: 66, pas: 76)
        players.append(player)
        addToTeam(player: player)
        
        // Balsalobre
        player = Player(name: "Balsalobre", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "CAM")
        player.updatePlayerStats(pace: 72, drib: 75, def: 74, str: 69, sho: 79, pas: 76)
        players.append(player)
        addToTeam(player: player)
        
        // Jose Santiago
        player = Player(name: "Jose Santiago", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "CB")
        player.updatePlayerStats(pace: 92, drib: 80, def: 94, str: 88, sho: 78, pas: 81)
        player.setPlayerImage(image: #imageLiteral(resourceName: "jose"))
        players.append(player)
        addToTeam(player: player)
        
        // Ari
        player = Player(name: "Ari", dateOfBirth: "08-02-1995", age: 22, country: "Puerto Rico", team: "Sticks FC", position: "LW")
        player.updatePlayerStats(pace: 80, drib: 81, def: 70, str: 79, sho: 82, pas: 77)
        players.append(player)
        addToTeam(player: player)
        
        // Brandon
        player = Player(name: "Brandon", dateOfBirth: "08-02-1995", age: 22, country: "Puerto Rico", team: "Sticks FC", position: "CAM")
        player.updatePlayerStats(pace: 82, drib: 91, def: 70, str: 79, sho: 85, pas: 88)
        players.append(player)
        addToTeam(player: player)
        
        // Chewys
        player = Player(name: "Chewys", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "GK")
        player.updatePlayerStats(pace: 82, drib: 85, def: 99, str: 71, sho: 78, pas: 66)
        players.append(player)
        addToTeam(player: player)
        
        // Ale
        player = Player(name: "Alexandra", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "ST")
        player.updatePlayerStats(pace: 70, drib: 66, def: 78, str: 62, sho: 73, pas: 76)
        players.append(player)
        addToTeam(player: player)
        
        // Juanga
        player = Player(name: "Juanga", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LM")
        player.updatePlayerStats(pace: 80, drib: 96, def: 81, str: 79, sho: 86, pas: 94)
        players.append(player)
        addToTeam(player: player)
        
        // Jorge
        player = Player(name: "Jorge", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "CDM")
        player.updatePlayerStats(pace: 74, drib: 78, def: 82, str: 84, sho: 87, pas: 80)
        players.append(player)
        addToTeam(player: player)
        
        // Flan
        player = Player(name: "Flan", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "CB")
        player.updatePlayerStats(pace: 93, drib: 80, def: 97, str: 95, sho: 83, pas: 87)
        players.append(player)
        addToTeam(player: player)
        
        // Zurdo
        player = Player(name: "Zurdo", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LB")
        player.updatePlayerStats(pace: 73, drib: 72, def: 82, str: 75, sho: 75, pas: 77)
        players.append(player)
        addToTeam(player: player)
        
        // Patricia
        player = Player(name: "Patricia", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LB")
        player.updatePlayerStats(pace: 72, drib: 76, def: 71, str: 71, sho: 77, pas: 78)
        players.append(player)
        addToTeam(player: player)
        
        // Patricia
        player = Player(name: "Manolas", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LB")
        player.updatePlayerStats(pace: 80, drib: 61, def: 86, str: 83, sho: 19, pas: 42)
        players.append(player)
        addToTeam(player: player)
    }
    
    func generateMatches() {
        // 0:   FC Prime
        // 1:   Croquetas Utd.
        // 2:   Stick FC
        // 3:   PPS
        matches.append(Match(teams: (teams[0], teams[1]), score: (3, 3)))
        matches.append(Match(teams: (teams[1], teams[2]), score: (1, 0)))
        matches.append(Match(teams: (teams[3], teams[2]), score: (1, 1)))
        matches.append(Match(teams: (teams[0], teams[3]), score: (5, 1)))
    }
    
    private func addToTeam(player: Player) {
        for team in teams {
            if player.team == team.teamName {
                team.addPlayer(player: player)
            }
        }
    }
    
}
