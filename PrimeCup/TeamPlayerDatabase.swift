//
//  PlayerFactory.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import UIKit

class TeamPlayerDatabase: NSObject {
    
    var players: [Player] = []
    var teams: [Team] = []
    var matches: [Match] = []
    var playerIDFactory: Int = 0
    
    override init() {
        super.init()
        DispatchQueue.main.async {
            self.generateTeams()
            self.handleDatabaseUpdates(completion: { (finished) in
                if finished {
                    for player in self.players {
                        self.addToTeam(player: player)
                    }
                    print("Loaded players successfully.")
                } else {
                    print("Error loading players from database.")
                }
            })
//            self.generateTeams()
//            self.generatePlayers()
//            self.addPlayersToFirebase()
        }
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
        player.playerID = "00"
        players.append(player)
        addToTeam(player: player)
        
        // Julian A. Rodriguez
        player = Player(name: "Juli", dateOfBirth: "08-01-1995", age: 23, country: "USA", team: "FC Prime", position: "LWB")
        player.updatePlayerStats(pace: 82, drib: 80, def: 83, str: 73, sho: 78, pas: 80)
        player.playerID = "01"
        players.append(player)
        addToTeam(player: player)
        
        // Isabel L. Rodriguez
        player = Player(name: "Isabel", dateOfBirth: "04-01-1998", age: 20, country: "USA", team: "FC Prime", position: "CF")
        player.updatePlayerStats(pace: 68, drib: 67, def: 73, str: 65, sho: 74, pas: 69)
        player.playerID = "02"
        players.append(player)
        addToTeam(player: player)
        
        // Luis A. Garcia
        player = Player(name: "Alejandro", dateOfBirth: "07-23-2000", age: 18, country: "Puerto Rico", team: "FC Prime", position: "CM")
        player.updatePlayerStats(pace: 72, drib: 82, def: 78, str: 81, sho: 81, pas: 84)
        player.playerID = "03"
        players.append(player)
        addToTeam(player: player)
        
        // Sebatian Requena
        player = Player(name: "Sebastian", dateOfBirth: "01-02-1996", age: 22, country: "USA", team: "FC Prime", position: "CDM")
        player.updatePlayerStats(pace: 79, drib: 87, def: 86, str: 84, sho: 87, pas: 90)
        player.playerID = "04"
        players.append(player)
        addToTeam(player: player)
        
        // Monti
        //var statLabels = ["Pace", "Shooting", "Passing", "Dribbling", "Defense", "Strength"]
        //var gkStatLabels = ["Diving", "Handling", "Kicking", "Reflexes", "Speed", "Positioning"]
        player = Player(name: "Monti", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Croquetas Utd.", position: "GK")
        player.updatePlayerStats(pace: 83, drib: 90, def: 80, str: 81, sho: 79, pas: 86)
        player.playerID = "05"
        players.append(player)
        addToTeam(player: player)
        
        // Javier Deya
        player = Player(name: "Javi", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "RW")
        player.updatePlayerStats(pace: 97, drib: 87, def: 80, str: 81, sho: 84, pas: 82)
        player.playerID = "06"
        players.append(player)
        addToTeam(player: player)
        
        // Andy
        player = Player(name: "Andy", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "LW")
        player.updatePlayerStats(pace: 75, drib: 76, def: 79, str: 72, sho: 78, pas: 74)
        player.playerID = "07"
        players.append(player)
        addToTeam(player: player)
        
        // Jose Irizzarri
        player = Player(name: "Irizarry", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "LB")
        player.updatePlayerStats(pace: 74, drib: 75, def: 84, str: 82, sho: 66, pas: 76)
        player.playerID = "08"
        players.append(player)
        addToTeam(player: player)
        
        // Balsalobre
        player = Player(name: "Balsalobre", dateOfBirth: "08-02-1995", age: 99, country: "Puerto Rico", team: "Croquetas Utd.", position: "CAM")
        player.updatePlayerStats(pace: 72, drib: 75, def: 74, str: 69, sho: 79, pas: 76)
        player.playerID = "09"
        players.append(player)
        addToTeam(player: player)
        
        // Jose Santiago
        player = Player(name: "Jose Santiago", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "CB")
        player.updatePlayerStats(pace: 92, drib: 80, def: 94, str: 88, sho: 78, pas: 81)
        player.playerID = "10"
        players.append(player)
        addToTeam(player: player)
        
        // Ari
        player = Player(name: "Ari", dateOfBirth: "08-02-1995", age: 22, country: "Puerto Rico", team: "Sticks FC", position: "LW")
        player.updatePlayerStats(pace: 80, drib: 81, def: 70, str: 79, sho: 82, pas: 77)
        player.playerID = "11"
        players.append(player)
        addToTeam(player: player)
        
        // Brandon
        player = Player(name: "Brandon", dateOfBirth: "08-02-1995", age: 22, country: "Puerto Rico", team: "Sticks FC", position: "CAM")
        player.updatePlayerStats(pace: 82, drib: 91, def: 70, str: 79, sho: 85, pas: 88)
        player.playerID = "12"
        players.append(player)
        addToTeam(player: player)
        
        // Chewys
        player = Player(name: "Francho", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "GK")
        player.updatePlayerStats(pace: 82, drib: 85, def: 99, str: 71, sho: 78, pas: 66)
        player.playerID = "13"
        players.append(player)
        addToTeam(player: player)
        
        // Ale
        player = Player(name: "Alexandra", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "Sticks FC", position: "ST")
        player.updatePlayerStats(pace: 70, drib: 66, def: 78, str: 62, sho: 73, pas: 76)
        player.playerID = "14"
        players.append(player)
        addToTeam(player: player)
        
        // Juanga
        player = Player(name: "Juanga", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LM")
        player.updatePlayerStats(pace: 80, drib: 96, def: 81, str: 79, sho: 86, pas: 94)
        player.playerID = "15"
        players.append(player)
        addToTeam(player: player)
        
        // Jorge
        player = Player(name: "Jorge", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "CDM")
        player.updatePlayerStats(pace: 74, drib: 78, def: 82, str: 84, sho: 87, pas: 80)
        player.playerID = "16"
        players.append(player)
        addToTeam(player: player)
        
        // Flan
        player = Player(name: "Flan", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "CB")
        player.updatePlayerStats(pace: 93, drib: 80, def: 97, str: 95, sho: 83, pas: 87)
        player.playerID = "17"
        players.append(player)
        addToTeam(player: player)
        
        // Zurdo
        player = Player(name: "Zurdo", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LB")
        player.updatePlayerStats(pace: 90, drib: 79, def: 85, str: 40, sho: 60, pas: 81)
        player.playerID = "18"
        players.append(player)
        addToTeam(player: player)
        
        // Patricia
        player = Player(name: "Patricia", dateOfBirth: "08-02-1995", age: 23, country: "Puerto Rico", team: "PPS", position: "LB")
        player.updatePlayerStats(pace: 72, drib: 76, def: 71, str: 71, sho: 77, pas: 78)
        player.playerID = "19"
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
    
    func resetTeams() {
        for team in self.teams {
            team.gamesPlayed = 0
            team.gamesWon = 0
            team.gamesLost = 0
            team.gamesTied = 0
            team.points = 0
            team.goalDifference = 0
        }
        for player in self.players {
            player.goals = 0
            player.assists = 0
        }
    }
    
    private func addToTeam(player: Player) {
        for team in teams {
            if player.team == team.teamName {
                var found = false
                for plr in team.teamMembers {
                    if plr.playerIDString == player.playerIDString {
                        found = true
                        continue
                    }
                }
                if !found { team.addPlayer(player: player) }
            }
        }
    }
    
    // RUN THIS ONLY ONCE
    func addPlayersToFirebase() {
        let ref = Database.database().reference()
        
        for player in players {
            ref.child("players").childByAutoId().setValue([
                "player_name":player.name,
                "player_pace":player.pace,
                "player_shooting":player.sho,
                "player_passing":player.pas,
                "player_dribbling":player.drib,
                "player_defense":player.def,
                "player_strength":player.str,
                "player_average":player.averageStats,
                "player_goals":player.goals,
                "player_assists":player.assists,
                "player_position":player.position,
                "player_team":player.team,
                "image_url_extension":player.playerIDString])
        }
    }
    
    func handleDatabaseUpdates(completion: @escaping (Bool) -> ()) {
        
        self.players = []
        let ref = Database.database().reference().child("players")

        ref.observe(DataEventType.value) { (snapshot) in
            let value = snapshot.value as! NSDictionary
            for playerDict in value {
                let player = playerDict.value as! NSDictionary
                let imageURLExtension = player["image_url_extension"] as! String
                let playerAssists = player["player_assists"] as! Int
                let playerAverage = player["player_average"] as! Int
                let playerDefense = player["player_defense"] as! Int
                let playerDribbling = player["player_dribbling"] as! Int
                let playerGoals = player["player_goals"] as! Int
                let playerName = player["player_name"] as! String
                let playerPace = player["player_pace"] as! Int
                let playerPassing = player["player_passing"] as! Int
                let playerShooting = player["player_shooting"] as! Int
                let playerStrength = player["player_strength"] as! Int
                let playerPosition = player["player_position"] as! String
                let playerTeam = player["player_team"] as! String
                
                let newPlayer = Player(name: playerName, dateOfBirth: "", age: 0, country: "", team: playerTeam, position: playerPosition)
                newPlayer.updatePlayerStats(pace: playerPace, drib: playerDribbling, def: playerDefense, str: playerStrength, sho: playerShooting, pas: playerPassing)
                newPlayer.goals = playerGoals
                newPlayer.assists = playerAssists
                newPlayer.playerIDString = imageURLExtension
                newPlayer.averageStats = playerAverage
                newPlayer.playerImage = #imageLiteral(resourceName: "Default Player Image")
            
                self.players.append(newPlayer)
                
            }
            if self.players.count == 20 {
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
}
