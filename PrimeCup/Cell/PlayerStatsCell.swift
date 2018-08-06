//
//  PlayerStatsCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/5/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class PlayerStatsCell: UITableViewCell {
    
    @IBOutlet weak var oPlayerPictureImageView: UIImageView!
    @IBOutlet weak var oPlayerNameLabel: UILabel!
    @IBOutlet weak var oPlayerGoalsLabel: UILabel!
    @IBOutlet weak var oPlayerAssistsLabel: UILabel!
    
    func setPlayer(player: Player) {
        oPlayerPictureImageView.image = player.playerImage
        oPlayerPictureImageView.layer.cornerRadius = oPlayerPictureImageView.frame.width / 2
        oPlayerPictureImageView.layer.masksToBounds = true
        oPlayerPictureImageView.layoutIfNeeded()
        oPlayerNameLabel.text = player.name
        oPlayerGoalsLabel.text = String(player.goals)
        oPlayerAssistsLabel.text = String(player.assists)
    }
}
