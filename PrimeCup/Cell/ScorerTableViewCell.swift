//
//  ScorerTableViewCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/13/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class ScorerTableViewCell: UITableViewCell {
    
    // Create outlets for cell
    
    func setScorer(player: Player) {
        self.textLabel?.text = player.name
        self.imageView?.image = player.playerImage
    }
    
}
