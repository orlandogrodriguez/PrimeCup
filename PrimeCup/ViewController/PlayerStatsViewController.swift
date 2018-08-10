//
//  PlayerStatsViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/6/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseStorage

class PlayerStatsViewController: UIViewController {
    
    var players: [Player] = []
    
    @IBOutlet weak var oPlayerStatsTableView: UITableView!
    
    private var refresher: UIRefreshControl = UIRefreshControl()
    private var loadingSpinnerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.players = (self.tabBarController!.viewControllers![0] as! StandingsViewController).database.players
        oPlayerStatsTableView.delegate = self
        oPlayerStatsTableView.dataSource = self
        
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(updateViewFromModel), for: .valueChanged)
        self.oPlayerStatsTableView.refreshControl = refresher
        
        handleDatabaseUpdates { (finished) in
            print("finished: \(finished)")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Top Players"
        self.view.layoutIfNeeded()
        if let index = self.oPlayerStatsTableView.indexPathForSelectedRow{
            self.oPlayerStatsTableView.deselectRow(at: index, animated: true)
        }
    }
    
    @objc func updateViewFromModel() {
        self.refresher.beginRefreshing()
        self.tabBarController?.navigationItem.title = "Top Players"
        oPlayerStatsTableView.tableFooterView = UIView()
        oPlayerStatsTableView.reloadData()
        self.refresher.endRefreshing()
    }
    
    func handleDatabaseUpdates(completion: @escaping (Bool) -> ()) {
        let storage = Storage.storage().reference()
        
        for player in players {
            var newPlayerImage: UIImage?
            let newPlayerImageReference = storage.child("\(player.playerIDString).png")
            newPlayerImageReference.getData(maxSize: 3 * 1024 * 1024, completion: { (data, error) in
                if let error = error {
                    print("------error getting picture for player.------")
                    print(error.localizedDescription)
                    completion(false)
                } else {
                    newPlayerImage = UIImage(data: data!)
                    player.setPlayerImage(image: newPlayerImage!)
                    print("successfully added picture for \(player.playerIDString)")
                    self.oPlayerStatsTableView.reloadData()
                    completion(true)
                }
            })
        }
    }

}

extension PlayerStatsViewController: UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UITabBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.players = self.players.sorted { (player1: Player, player2: Player) -> Bool in
            
            
            let player1Goals = player1.goals
            let player2Goals = player2.goals
            
            let player1Assists = player1.assists
            let player2Assists = player2.assists
            
            
            if player1Goals == player2Goals {
                if player1Assists == player2Assists {
                    return player1.name < player2.name
                } else {
                    return player1Assists > player2Assists
                }
            } else {
                return player1Goals > player2Goals
            }
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerStatsCell") as! PlayerStatsCell
        cell.setPlayer(player: players[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "playerVC") as! PlayerViewController
        nextVC.player = self.players[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
