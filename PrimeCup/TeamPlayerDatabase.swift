//
//  PlayerFactory.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation

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
        teams.append(Team(teamName: "Stick FC", teamLogo: #imageLiteral(resourceName: "stickfc"),teamMembers: []))
        teams.append(Team(teamName: "PPS", teamLogo: #imageLiteral(resourceName: "pps"),teamMembers: []))
    }
    
    func generatePlayers() {
        // Orlando G. Rodriguez
        let dito = Player(name: "Dito", dateOfBirth: "07-01-1994", age: 24, country: "USA", team: "FC Prime", position: "GK")
        dito.updatePlayerStats(pace: 90, drib: 90, def: 90, str: 90, sho: 90, pas: 90)
        players.append(dito)
        addToTeam(player: dito)
        
        // Julian A. Rodriguez
        let juli = Player(name: "Juli", dateOfBirth: "08-01-1995", age: 23, country: "USA", team: "FC Prime", position: "LB")
        juli.updatePlayerStats(pace: 90, drib: 90, def: 90, str: 90, sho: 90, pas: 90)
        players.append(juli)
        addToTeam(player: juli)
        
        // Isabel L. Rodriguez
        let isa = Player(name: "Isabel", dateOfBirth: "04-01-1998", age: 20, country: "USA", team: "FC Prime", position: "RB")
        isa.updatePlayerStats(pace: 90, drib: 90, def: 90, str: 90, sho: 90, pas: 90)
        players.append(juli)
        addToTeam(player: isa)
        
        // Luis A. Garcia
        let alejandro = Player(name: "Alejandro", dateOfBirth: "07-23-2000", age: 18, country: "Puerto Rico", team: "FC Prime", position: "CB")
        alejandro.updatePlayerStats(pace: 90, drib: 90, def: 90, str: 90, sho: 90, pas: 90)
        players.append(alejandro)
        addToTeam(player: alejandro)
        
        // Sebatian Requena
        let seba = Player(name: "Sebastian", dateOfBirth: "01-02-1996", age: 22, country: "USA", team: "FC Prime", position: "LB")
        seba.updatePlayerStats(pace: 90, drib: 90, def: 90, str: 90, sho: 90, pas: 90)
        players.append(seba)
        addToTeam(player: seba)
    }
    
    func generateMatches() {
        // 0:   FC Prime
        // 1:   Croquetas Utd.
        // 2:   Stick FC
        // 3:   PPS
        matches.append(Match(teams: (teams[0], teams[1]), score: (3, 2)))
        matches.append(Match(teams: (teams[1], teams[2]), score: (0, 2)))
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
