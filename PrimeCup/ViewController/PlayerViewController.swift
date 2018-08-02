//
//  PlayerViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/1/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var player: Player?

    @IBOutlet weak var oPlayerPictureImageView: UIImageView!
    @IBOutlet weak var oPlayerNameLabel: UILabel!
    @IBOutlet weak var oPlayerAverageStatsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let player = player else { return }
        oPlayerPictureImageView.image = player.playerImage
        oPlayerNameLabel.text = player.name
        oPlayerAverageStatsLabel.text = String(player.averageStats)
    }

}
