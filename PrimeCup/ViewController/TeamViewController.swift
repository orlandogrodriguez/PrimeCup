//
//  TeamViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/31/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var team: Team?
    @IBOutlet weak var oTeamLogoImageView: UIImageView!
    @IBOutlet weak var oTeamNameLabel: UILabel!
    @IBOutlet weak var oPlayersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oPlayersTableView.delegate = self
        oPlayersTableView.dataSource = self
        if let team = team {
            oTeamLogoImageView.image = team.teamLogo
            oTeamNameLabel.text = team.teamName
        } else {
            oTeamLogoImageView.image = UIImage()
            oTeamNameLabel.text = "--"
            
        }
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let team = team else { return 0 }
        return team.teamMembers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        cell.setPlayer(player: team!.teamMembers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "playerVC") as! PlayerViewController
        nextVC.player = self.team!.teamMembers[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
