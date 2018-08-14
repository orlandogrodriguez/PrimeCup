//
//  SelectScorerViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/13/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class SelectScorerViewController: UIViewController {
    
    var players: [Player]?
    var playerTeam: Team? {
        didSet {
            players = playerTeam?.teamMembers
        }
    }
    @IBOutlet weak var oScorersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oScorersTableView.delegate = self
        oScorersTableView.dataSource = self
    }
}

extension SelectScorerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let players = players else { return 0 }
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.players != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScorerCell") as! ScorerTableViewCell
            let scorer = self.players![indexPath.row]
            cell.setScorer(player: scorer)
            return cell
        } else {
            print("Error getting cell for scorer.")
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectAssistVC") as! SelectAssistViewController
        nextVC.scorer = players![indexPath.row]
        nextVC.players = players!
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
