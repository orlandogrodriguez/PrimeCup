//
//  TeamViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/31/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class TeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var team: Team?
    @IBOutlet weak var oTeamLogoImageView: UIImageView!
    @IBOutlet weak var oTeamNameLabel: UILabel!
    @IBOutlet weak var oPlayersTableView: UITableView!
    @IBOutlet weak var oStarsView: UIView!
    @IBOutlet weak var oStarsConstraint: NSLayoutConstraint!
    @IBOutlet weak var oScrollView: UIScrollView!
    
    @IBOutlet weak var oTopSectionView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oPlayersTableView.delegate = self
        oPlayersTableView.dataSource = self
        
        
        
        
        handleDatabaseUpdates { (finished) in
            print("\(finished)")
        }
        
        if let team = team {
            oTeamLogoImageView.image = team.teamLogo
            oTeamNameLabel.text = team.teamName
            oStarsConstraint.constant = 240
            var averageTeamScore: Double = 0
            for player in team.teamMembers {
                averageTeamScore += Double(player.averageStats)
            }
            averageTeamScore /= Double(team.teamMembers.count)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.oStarsConstraint.constant = 240.0 - CGFloat(240.0 * (averageTeamScore / 100.0))
                self.view.layoutIfNeeded()
            }) { (finished) in
                print("Finished animation.")
            }
            
        } else {
            oTeamLogoImageView.image = UIImage()
            oTeamNameLabel.text = "--"
            
        }
        
    }

    

    
    func handleDatabaseUpdates(completion: @escaping (Bool) -> ()) {
        let storage = Storage.storage().reference()
        guard let team = self.team else {
            print("No team available! Check out this bug.")
            return
        }
        for player in team.teamMembers {
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
                    self.oPlayersTableView.reloadData()
                    completion(true)
                }
            })
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
