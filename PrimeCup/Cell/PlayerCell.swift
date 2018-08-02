//
//  PlayerCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/31/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    var player: Player?
    
    @IBOutlet weak var oPlayerPictureImageView: UIImageView!
    @IBOutlet weak var oPlayerNameLabel: UILabel!
    @IBOutlet weak var oPlayerAverageStatsLabel: UILabel!
    
    func setPlayer(player: Player) {
        self.player = player
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        oPlayerPictureImageView.image = player!.playerImage
        oPlayerNameLabel.text = player?.name
        oPlayerAverageStatsLabel.text = String(player!.averageStats)
        oPlayerPictureImageView.layer.cornerRadius = 32
        oPlayerPictureImageView.layer.masksToBounds = true
    }

}
