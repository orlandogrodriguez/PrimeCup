//
//  PlayerStatsViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/6/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class PlayerStatsViewController: UIViewController {
    
    var players: [Player] = []
    
    @IBOutlet weak var oPlayerStatsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.players = (self.tabBarController!.viewControllers![0] as! StandingsViewController).database.players
        oPlayerStatsTableView.delegate = self
        oPlayerStatsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension PlayerStatsViewController: UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UITabBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.players = self.players.sorted { (player1: Player, player2: Player) -> Bool in
            let player1Points = (player1.goals * 2) + player1.assists
            let player2Points = (player2.goals * 2) + player2.assists
            return player1Points > player2Points
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerStatsCell") as! PlayerStatsCell
        cell.setPlayer(player: players[indexPath.row])
        return cell
        
    }
    
    
}